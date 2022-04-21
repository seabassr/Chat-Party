//
//  ProfileBubble.swift
//  Chat Party
//
//  Created by Sebastian Rodriguez on 4/11/22.
//

import SwiftUI

struct ProfileBubble<Content>: View where Content: View {
    let direction: MessageBubble.Direction
    let content: () -> Content
    
    init(direction: MessageBubble.Direction, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.direction = direction
    }
    
    var body: some View {
        HStack {
            if direction == .right {
                Spacer()
            }
            
            content().clipShape(MessageBubble(direction: direction))
            
            if direction == .left {
                Spacer()
            }
        }
        .padding([.leading, .trailing], 10)
    }
}

struct ProfileBubble_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                ProfileBubble(direction: .left) {
                    Text("Test")
                        .padding(.all, 20)
                        .foregroundColor(Color.white)
                        .background(.secondary)
                }
            }
            
            ProfileBubble(direction: .right) {
                Text("Test")
                    .padding(.all, 20)
                    .foregroundColor(Color.white)
                    .background(.blue)
            }
        }
    }
}
