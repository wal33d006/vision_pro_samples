//
//  NewsListView.swift
//  New Vision App
//
//  Created by Waleed Arshad on 22/06/2023.
//

import SwiftUI

struct NewsListView: View {
    let posts: [Post]
    var body: some View {
        List(posts) { post in
            VStack {
                NavigationLink {
                    DetailView(post: post)
                } label: {
                    HStack {
                        Text(String(post.points))
                        VStack {
                            Text(post.title)
                            
                        }
                    }
                }
                Divider()
                    .overlay(Color(.gray))
                
                HStack {
                    Image(systemName: "text.bubble.fill")
                    Text("Comments: \(String(post.num_comments))")
                }
                .frame(alignment: .leading)
                
            }
        }
        .navigationTitle("News")
    }
}


#Preview {
    NewsListView(posts: [])
}
