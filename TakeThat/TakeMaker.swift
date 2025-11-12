//
//  TakeMaker.swift
//  TakeThat
//
//  Created by nick on 11/10/25.
//

import SwiftUI

struct TakeMaker: View {
    @ObservedObject var sharedData: SharedData   // 👈 receive the shared object
    @State private var newPost = ""

    var body: some View {
        VStack {
            TextField("Enter something", text: $newPost)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Add Post") {
                sharedData.creating = false
                sharedData.posts.append(Post(text: newPost, likes: 0))   // 👈 append to the shared array
                newPost = ""                       // optional: clear field
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .navigationTitle("TakeMaker")
    }
}

#Preview {
    TakeMaker(sharedData: SharedData()) // 👈 this fixes the preview
}
