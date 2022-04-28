//
//  Profile.swift
//  Chat Party
//
//  Created by Sebastian Rodriguez on 3/29/22.
//

import Foundation

class Profile: ObservableObject {
    @Published var items: ProfileItem = ProfileItem(username: "User", userPic: "👾", colorR: 0.0, colorG: 0.0, colorB: 0.0) {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode(ProfileItem.self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = ProfileItem.default
    }
}

struct ProfileItem: Codable {
    var id = UUID().uuidString
    var username: String
    var userPic: String
    var colorR: Double
    var colorG: Double
    var colorB: Double
    
    static let `default` = ProfileItem(username: "User", userPic: "👾", colorR: 0.0, colorG: 0.0, colorB: 0.0)
}
