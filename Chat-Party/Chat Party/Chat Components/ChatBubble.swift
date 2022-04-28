//
//  ChatBubble.swift
//  Chat Party
//
//  Created by Sebastian Rodriguez on 4/11/22.
//

import SwiftUI

struct ChatBubble<Content>: View where Content: View {
    let direction: MessageBubble.Direction
    let content: () -> Content
    let profilePic: String
    let username: String
    
    init(direction: MessageBubble.Direction, profilePic: String, username: String,
         @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.direction = direction
        self.profilePic = profilePic
        self.username = username
    }
    
    var body: some View {
        HStack {
            if direction == .right {
                Spacer()
            }
            else {
                Text(profilePic)
            }
            
            VStack {
                content().clipShape(MessageBubble(direction: direction))
                Text("@\(username)")
                    .font(.caption)
                    .foregroundColor(.white)
            }
            
            if direction == .left {
                Spacer()
            }
            else {
                Text(profilePic)
            }
        }
        .padding([.leading, .trailing], 10)
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                ChatBubble(direction: .left, profilePic: "👾", username: "User") {
                    Text("Test")
                        .padding(.all, 20)
                        .foregroundColor(Color.white)
                        .background(.secondary)
                }
            }
            
            ChatBubble(direction: .right, profilePic: "👾", username: "User2") {
                Text("Test")
                    .padding(.all, 20)
                    .foregroundColor(Color.white)
                    .background(.blue)
            }
        }
    }
}
