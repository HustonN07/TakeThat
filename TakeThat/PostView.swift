//
//  PostView.swift
//  TakeThat
//
//  Created by nick on 11/10/25.
//

import SwiftUI

struct PostView: View {
    @Binding var post: Post   // <-- Binding so the button can mutate it

    var body: some View {
        VStack {
            HStack {
                Text(post.text).padding(.leading, 20)
                Spacer()
            }
            HStack {
                Button { post.liked() } label: {
                    Image("heartEmpty")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                        .padding(.leading)
                }
                Text("\(post.likes)")
                    .font(.title)
                    .fontWeight(.medium)
                    .padding(.leading, 3)
                Spacer()
            }
        }
    }
}

#Preview {
    // Preview needs a Binding; use .constant(...)
    PostView(post: .constant(Post(text: "hi", likes: 0)))
}


