//
//  ChatBottom.swift
//  Chat Party
//
//  Created by Sebastian Rodriguez on 4/8/22.
//

import SwiftUI

struct ChatBottom: View {
    @ObservedObject var viewModel = Message()
    @State private var messageEntry: String = ""
    let chatroom: RoomItem
    let profile: ProfileItem
    
    var body: some View {
        VStack {
            HStack {
                TextField(" Message", text: $messageEntry)
                    .keyboardType(.alphabet)
                    .foregroundColor(.white)
                
                Button {
                    pressSend()
                } label: {
                    Circle()
                        .fill(.blue)
                        .overlay(Image(systemName: "paperplane.fill")
                            .foregroundColor(.white))
                        .frame(width: 40, height: 40)
                }
            }
            .padding(5)
            .background(.secondary)
            .cornerRadius(30)
            .padding([.trailing, .leading])
        }
    }
    
    func pressSend() {
        viewModel.sendMessage(messageContent: messageEntry, code: String(chatroom.code),
                              userId: profile.id, userPic: profile.userPic,
                              username: profile.username, colorR: profile.colorR,
                              colorG: profile.colorG, colorB: profile.colorB)
        messageEntry = ""
    }
}

struct ChatBottom_Previews: PreviewProvider {
    static var previews: some View {
        ChatBottom(chatroom: RoomItem(code: 123456), profile: ProfileItem.default)
    }
}
