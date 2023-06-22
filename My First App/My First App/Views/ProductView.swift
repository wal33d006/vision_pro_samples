//
//  EventView.swift
//  New Vision App
//
//  Created by Waleed Arshad on 22/06/2023.
//

import SwiftUI

struct ProductView: View {
    let product: Product
    
    let gridItem = GridItem(.flexible())
    
    var columns: [GridItem] { [self.gridItem, self.gridItem, self.gridItem]}
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading) {
                Text("Product description")
                    .font(.caption)
                Text("\(product.description)")
                    .font(.title2)
                
                
            }
            .padding()
            .padding()
            .padding(.horizontal)
            .background(RoundedRectangle(cornerRadius: 10.0)
                .fill(.black.opacity(0.1))
                .shadow(radius: 3)
            )
            HStack(alignment: .center) {
                AsyncImage(url: URL(string: product.thumbnail), content: { image in
                    image
                        .resizable()
                        .frame(width: 500, height: 500)
                        .aspectRatio(1, contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                }, placeholder: {
                    Image(systemName: "person.fill")
                })
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Selling price")
                            .font(.caption)
                        Text("\(String(product.price.formatted())) USD")
                            .font(.title2)
                        
                        
                    }
                    .padding()
                    .padding()
                    .padding(.horizontal)
                    .frame(width: 300)
                    .background(RoundedRectangle(cornerRadius: 10.0)
                        .fill(.black.opacity(0.1))
                        .shadow(radius: 3)
                    )
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("In stock")
                            .font(.caption)
                        Text("\(String(product.stock.formatted())) pieces")
                            .font(.title2)
                        
                        
                    }
                    .padding()
                    .padding()
                    .padding(.horizontal)
                    .frame(width: 300)
                    .background(RoundedRectangle(cornerRadius: 10.0)
                        .fill(.black.opacity(0.1))
                        .shadow(radius: 3)
                    )
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Rating")
                            .font(.caption)
                        Text("\(String(product.rating.formatted()))/5")
                            .font(.title2)
                        
                        
                    }
                    .padding()
                    .padding()
                    .padding(.horizontal)
                    .frame(width: 300)
                    .background(RoundedRectangle(cornerRadius: 10.0)
                        .fill(.black.opacity(0.1))
                        .shadow(radius: 3)
                    )
                    
                    
                    
                }
            }
        }
        
    }
}

#Preview {
    ProductView(product: Product(id: 2, title: "iPhone X",description: "", thumbnail: "https://i.dummyjson.com/data/products/1/4.jpg", stock: 123,discountPercentage: 12.3, rating: 4.9, price: 453, images: []))
        .fixedSize()
}
