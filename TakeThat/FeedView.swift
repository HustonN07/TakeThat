import SwiftUI

struct FeedView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Feed Screen")
                .font(.largeTitle)

            Button("Sign Out") {
                authViewModel.signOut()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
