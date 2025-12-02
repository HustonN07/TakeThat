//
//  ContentView.swift
//  TakeThat
//
//  Created by nick on 11/6/25.
//

import SwiftUI
import SwiftData
import FirebaseAuth



struct ContentView: View {
    @StateObject var sharedData = SharedData()   // 👈 create one shared instance
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Sign Out") {
                    try? Auth.auth().signOut()
                }
                .padding()
               
                @EnvironmentObject var authViewModel: AuthViewModel



                
                Spacer()
                if(sharedData.creating){
                    TakeMaker(sharedData: sharedData)
                        .labelsHidden()
                }
                else{
                    Button {
                        sharedData.creating = true
                    } label: {
                        Image("plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 75)
                            .padding(.leading)
                    }
                }

//                NavigationLink("Make a Take") {
//                    TakeMaker(sharedData: sharedData)   // 👈 pass it here
//                }
//                .padding()
            }
        }
    }
    
    
}

#Preview {
    ContentView()
        
}
