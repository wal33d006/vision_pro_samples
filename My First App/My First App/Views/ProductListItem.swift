//
//  ProductListItem.swift
//  New Vision App
//
//  Created by Waleed Arshad on 22/06/2023.
//

import SwiftUI

struct ProductListItem: View {
    let product: Product
    var body: some View {
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
    }
}

#Preview {
    ProductListItem(product: Product(id: 123, title: "", description: "", thumbnail: "", stock: 12.2, discountPercentage: 12.2, rating: 3.2, price: 123.2, images: []))
}
