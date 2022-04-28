//
//  MessageItem.swift
//  Chat Party
//
//  Created by Sebastian Rodriguez on 4/6/22.
//

import Foundation
import Firebase

class Message: ObservableObject {
    @Published var messages = [MessageItem]()
    private let db = Firestore.firestore()
    
    func sendMessage(messageContent: String, code: String, userId: String,
                     userPic: String, username: String, colorR: Double,
                     colorG: Double, colorB: Double) {
        db.collection("rooms").document(code).collection("messages").addDocument(data: ["sentDate": Date(),
                                                                                        "senderID": userId,
                                                                                        "messageContent": messageContent,
                                                                                        "userPic": userPic,
                                                                                        "username": username,
                                                                                        "colorR": colorR,
                                                                                        "colorG": colorG,
                                                                                        "colorB": colorB])
    }
    
    func fetchMessage(code: String) {
        db.collection("rooms").document(code).collection("messages").order(by: "sentDate", descending: false).addSnapshotListener({(snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("no documents")
                return
            }
            
            self.messages = documents.map { docSnapshot -> MessageItem in
                let data = docSnapshot.data()
                let docId = docSnapshot.documentID
                let contect = data["messageContent"] as? String ?? ""
                let userId = data["senderID"] as? String ?? ""
                let profilePic = data["userPic"] as? String ?? ""
                let username = data["username"] as? String ?? ""
                let colorR = data["colorR"] as? Double ?? 0.0
                let colorG = data["colorG"] as? Double ?? 0.0
                let colorB = data["colorB"] as? Double ?? 0.0
                return MessageItem(id: docId, content: contect, userId: userId,
                                   userPic: profilePic, username: username, colorR: colorR,
                                   colorG: colorG, colorB: colorB)
            }
        })
    }
}

struct MessageItem: Codable, Identifiable, Hashable {
    var id: String?
    var content: String
    var userId: String
    var userPic: String
    var username: String
    var colorR: Double
    var colorG: Double
    var colorB: Double
}
