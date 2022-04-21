//
//  ProfilePic.swift
//  Chat Party
//
//  Created by Sebastian Rodriguez on 3/31/22.
//

import SwiftUI

struct ProfilePic: View {
    @EnvironmentObject var profile: Profile
    
    var body: some View {
        Text(profile.items.userPic)
            .font(.system(size: 150))
            .frame(width: 250, height: 250)
            .background(
                VStack {
                    ProfileBubble(direction: .left) {
                        Text("                                      ")
                            .padding(.all, 20)
                            .background(
                                Color(red: profile.items.colorR,
                                      green: profile.items.colorG,
                                      blue: profile.items.colorB)
                            )
                    }
                    
                    ProfileBubble(direction: .right) {
                        Text("                                      ")
                            .padding(.all, 20)
                            .background(
                                Color(red: profile.items.colorR,
                                      green: profile.items.colorG,
                                      blue: profile.items.colorB)
                            )
                    }
                    
                    ProfileBubble(direction: .left) {
                        Text("                                      ")
                            .padding(.all, 20)
                            .background(
                                Color(red: profile.items.colorR,
                                      green: profile.items.colorG,
                                      blue: profile.items.colorB)
                            )
                    }
                }
            )
            .padding(.bottom)
    }
}

struct ProfilePic_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePic()
            .environmentObject(Profile())
    }
}
