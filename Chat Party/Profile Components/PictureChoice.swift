//
//  PictureChoice.swift
//  Chat Party
//
//  Created by Sebastian Rodriguez on 4/11/22.
//

import SwiftUI

struct PictureChoice: View {
    @EnvironmentObject var profile: Profile
    let profilePick: [String] = ["👽", "👻", "👾", "🤠", "🤡", "💩", "💀" , "🤖"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(profilePick, id: \.self) { i in
                    Button(i, action: {profile.items.userPic = i})
                        .font(.system(size: 70))
                        .frame(width: 90, height: 90)
                        .background(
                            Circle()
                                .fill(.white)
                        )
                }
            }
            .padding([.trailing, .leading, .bottom])
        }
    }
}

struct PictureChoice_Previews: PreviewProvider {
    static var previews: some View {
        PictureChoice()
            .environmentObject(Profile())
    }
}
