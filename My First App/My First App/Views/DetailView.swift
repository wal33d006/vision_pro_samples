//
//  DetailView.swift
//  H4XOP News
//
//  Created by Waleed Arshad on 22/06/2023.
//

import SwiftUI

struct DetailView: View {
    let post: Post
    var body: some View {
        VStack {
            HStack {
                Text("Published by \(post.author)")
                    .font(.title)
                
            }
            WebView(urlString: post.url)
        }
    }
}

#Preview {
    DetailView(post: Post(objectID: "12344", points: 435, title: "Hello World", url: "https://www.google.com", num_comments: 543, author: "waleed"))
}
