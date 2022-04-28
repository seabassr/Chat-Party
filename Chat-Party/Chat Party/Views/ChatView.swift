//
//  MessagePage.swift
//  Chat Party
//
//  Created by Sebastian Rodriguez on 3/24/22.
//

import SwiftUI

struct ChatView: View {
    let chatroom: RoomItem
    let profile: ProfileItem
    
    var body: some View {
        VStack {
            ChatTitle(chatroom: self.chatroom)
            
            ChatScroll(chatroom: self.chatroom, profile: self.profile)
            
            ChatBottom(chatroom: self.chatroom, profile: self.profile)
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .navigationBarHidden(true)
        .background(contentBG.ignoresSafeArea())
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chatroom: RoomItem(code: 123456), profile: ProfileItem.default)
    }
}
