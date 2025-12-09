import SwiftUI

struct LoginView: View {
    @StateObject var authViewModel = AuthViewModel()
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("TakeThat")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
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
            } else {
                Button("Login") {
                    authViewModel.login(email: email, password: password)
                }
                .buttonStyle(.borderedProminent)

                Button("Create Account") {
                    authViewModel.signUp(email: email, password: password)
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
        .fullScreenCover(isPresented: $authViewModel.isLoggedIn) {
            FeedView(authViewModel: authViewModel)
        }
    }
}
