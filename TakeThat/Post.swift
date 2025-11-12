//
//  Post.swift
//  TakeThat
//
//  Created by nick on 11/10/25.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    var id: UUID = UUID()
    var text: String
    var likes: Int
    mutating func liked() { likes += 1 }
}
