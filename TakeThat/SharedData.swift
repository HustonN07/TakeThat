//
//  SharedData.swift
//  TakeThat
//
//  Created by nick on 11/10/25.
//

import Foundation

class SharedData: ObservableObject {
    @Published var creating = false
    @Published var posts: [Post] = [] {
        didSet { save() }
    }

    init() { load() }

    // MARK: - File URL
    private var fileURL: URL {
        let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return docs.appendingPathComponent("posts.json")
    }

    // MARK: - Load / Save
    private func load() {
        let url = fileURL
        guard FileManager.default.fileExists(atPath: url.path) else { return }
        do {
            let data = try Data(contentsOf: url)
            posts = try JSONDecoder().decode([Post].self, from: data)
        } catch {
            print("Load error:", error)
        }
    }

    private func save() {
        do {
            let data = try JSONEncoder().encode(posts)
            try data.write(to: fileURL, options: [.atomic])
        } catch {
            print("Save error:", error)
        }
    }
}
