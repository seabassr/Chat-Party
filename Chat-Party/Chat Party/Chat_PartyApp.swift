//
//  Chat_PartyApp.swift
//  Chat Party
//
//  Created by Sebastian Rodriguez on 3/24/22.
//

import SwiftUI
import Firebase

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

@main
struct Chat_PartyApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Profile())
        }
    }
}
