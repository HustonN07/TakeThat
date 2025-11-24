//
//  AuthViewModel.swift
//  TakeThat
//
//  Created by Max Khomutin on 11/24/25.
//

import Foundation
import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var user: User?

    init() {
        self.user = Auth.auth().currentUser
    }

    func signUp(email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(error)
                return
            }
            self.user = result?.user
            completion(nil)
        }
    }

    func signIn(email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(error)
                return
            }
            self.user = result?.user
            completion(nil)
        }
    }

    func signOut() {
        try? Auth.auth().signOut()
        self.user = nil
    }
}
