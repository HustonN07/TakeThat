//
//  LoginView.swift
//  TakeThat
//
//  Created by Max Khomutin on 11/24/25.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @ObservedObject var auth = AuthViewModel()
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""

    var body: some View {
        VStack(spacing: 20) {
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)

            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)

            Button("Sign In") {
                auth.signIn(email: email, password: password) { error in
                    if let error {
                        errorMessage = error.localizedDescription
                    }
                }
            }
            .buttonStyle(.borderedProminent)

            Button("Sign Up") {
                auth.signUp(email: email, password: password) { error in
                    if let error {
                        errorMessage = error.localizedDescription
                    }
                }
            }
            .padding(.top, 5)

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}
