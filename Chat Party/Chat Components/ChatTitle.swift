//
//  ChatTitle.swift
//  Chat Party
//
//  Created by Sebastian Rodriguez on 4/8/22.
//

import SwiftUI

struct ChatTitle: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = Room()
    @State private var showingExit: Bool = false
    let chatroom: RoomItem
    
    var body: some View {
        Rectangle()
            .fill(.secondary)
            .overlay(
                VStack {
                    Spacer()
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Group ID: \(String(chatroom.code))")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(height: 20)
                        }
                        
                        Spacer()
                        
                        Button {
                            showingExit = true
                        } label: {
                            Image(systemName: "xmark.circle")
                                .foregroundColor(.white)
                                .background(Circle()
                                    .fill(.red))
                                .font(.system(size: 40))
                        }
                    }
                    .padding()
                }
            )
            .edgesIgnoringSafeArea(.top)
            .frame(height: 70)
            .alert("You want to leave the chat?", isPresented: $showingExit) {
                Button("Leave", action: {
                    viewModel.leaveRoom(code: String(chatroom.code), completion: {})
                    presentationMode.wrappedValue.dismiss()
                })
                Button("Stay", action: {
                    showingExit = false
                })
            }
    }
}

struct ChatTitle_Previews: PreviewProvider {
    static var previews: some View {
        ChatTitle(chatroom: RoomItem(code: 123456))
    }
}
