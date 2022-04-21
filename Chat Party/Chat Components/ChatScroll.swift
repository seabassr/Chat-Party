//
//  ChatScroll.swift
//  Chat Party
//
//  Created by Sebastian Rodriguez on 4/11/22.
//

import SwiftUI

struct ChatScroll: View {
    @ObservedObject var viewModel = Message()
    let chatroom: RoomItem
    let profile: ProfileItem
    
    init(chatroom: RoomItem, profile: ProfileItem) {
        self.chatroom = chatroom
        self.profile = profile
        viewModel.fetchMessage(code: String(chatroom.code))
    }
    
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.vertical) {
                ForEach(viewModel.messages, id: \.self) { message in
                    HStack {
                        ChatBubble(direction: (message.userId == profile.id) ? .right : .left,
                                   profilePic: message.userPic, username: message.username) {
                            Text("\(message.content)")
                                .padding(.all, 20)
                                .foregroundColor(.white)
                                .background(
                                    Color(red: message.colorR, green: message.colorG, blue: message.colorB)
                                )
                        }
                        .id(message)
                        .onAppear {
                            withAnimation {
                                scrollView.scrollTo(viewModel.messages[viewModel.messages.count - 1])
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ChatScroll_Previews: PreviewProvider {
    static var previews: some View {
        ChatScroll(chatroom: RoomItem(code: 123456), profile: ProfileItem.default)
    }
}
