import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("TakeThat")
                .font(.largeTitle)

            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            if let error = authViewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }

            if authViewModel.isLoading {
                ProgressView()
            }

            Button("Login") {
                authViewModel.login(email: email, password: password)
            }
            .buttonStyle(.borderedProminent)

            Button("Create Account") {
                authViewModel.signUp(email: email, password: password)
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}
