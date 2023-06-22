//
//  ContentView.swift
//  New Vision App
//
//  Created by Waleed Arshad on 22/06/2023.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    // Dummy values for slider
    @State private var fontSize = 12.0
    @State private var bold = false
    @State private var italic = false
    
    @State private var product: Product?
    @ObservedObject var networkManager = NewsNetworkManager()
    @ObservedObject var productsNetworkManager = ProductsNetworkManager()
    
    var body: some View {
        TabView {
            NavigationSplitView {
                List(productsNetworkManager.products, selection: $product) { product in
                    ProductListItem(product: product)
                    .onTapGesture {
                        self.product = product
                    }
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 10.0)
                        .fill(product.id == self.product?.id ? .black.opacity(0.1) : .black.opacity(0.0))
                        .shadow(radius: 3)
                    )
                }
                .padding(.top)
                .navigationTitle("Products")
            }detail: {
                if let safeProduct = product {
                    ProductView(product: safeProduct)
                        .navigationTitle(safeProduct.title)
                }
            }
            .onAppear(perform: {
                productsNetworkManager.fetchData()
            })
            
            
            .tabItem { Label(
                title: { Text("Products") },
                icon: { Image(systemName: "scribble.variable") }
            )}
            NavigationView {
                if(networkManager.isLoading) {
                    ProgressView()
                } else {
                    NewsListView(posts: networkManager.posts)
                }
                
            }
            .onAppear(perform: {
                networkManager.fetchData()
            })
            .tabItem { Label(
                title: { Text("News") },
                icon: { Image(systemName: "text.bubble.fill") }
            )}
            .toolbar {
                ToolbarItemGroup(placement: .bottomOrnament) {
                    Slider(
                        value: $fontSize,
                        in: 8...120,
                        minimumValueLabel:
                            Text("A").font(.system(size: 8)),
                        maximumValueLabel:
                            Text("A").font(.system(size: 16))
                    ) {
                        Text("Font Size (\(Int(20)))")
                    }
                    .frame(width: 150)
                    Toggle(isOn: $bold) {
                        Image(systemName: "bold")
                    }
                    Toggle(isOn: $italic) {
                        Image(systemName: "italic")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
