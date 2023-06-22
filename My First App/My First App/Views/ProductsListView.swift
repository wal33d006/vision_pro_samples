//
//  ProductsListView.swift
//  New Vision App
//
//  Created by Waleed Arshad on 22/06/2023.
//

import SwiftUI

struct ProductsListView: View {
    
    let products: [Product]
    @State private var product: Product?
    
    var body: some View {
        List(products, selection: $product) { product in
            HStack {
                AsyncImage(url: URL(string: product.thumbnail), content: { image in
                    image
                        .resizable()
                        .frame(width: 40, height: 40)
                        .aspectRatio(1, contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                }, placeholder: {
                    Image(systemName: "person.fill")
                })
                Text(product.title)
            }
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
    }
}

#Preview {
    ProductsListView(products: [])
}
