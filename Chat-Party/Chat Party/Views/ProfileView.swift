//
//  ProfilePage.swift
//  Chat Party
//
//  Created by Sebastian Rodriguez on 3/24/22.
//

import SwiftUI

let profileBG = LinearGradient(gradient: Gradient(colors: [Color.indigo, Color.mint]),
                               startPoint: .top, endPoint: .bottom)

struct ProfileView: View {
    @EnvironmentObject var profile: Profile
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ProfilePic()
                    .environmentObject(profile)
                
                Text("Username:")
                    .font(.headline)
                
                TextField("Username", text: $profile.items.username)
                    .keyboardType(.alphabet)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.thickMaterial)
                        .frame(height: 35))
                    .padding([.trailing, .leading, .bottom])
                
                Text("Profile Picture:")
                    .font(.headline)
                
                PictureChoice()
                    .environmentObject(profile)
                
                Text("Chat Bubble Color:")
                    .font(.headline)
                
                ColorChoice()
                    .environmentObject(profile)
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .padding([.bottom, .top])
        .background(profileBG.ignoresSafeArea())
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(Profile())
    }
}
