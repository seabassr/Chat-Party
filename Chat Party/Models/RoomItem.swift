//
//  Message.swift
//  Chat Party
//
//  Created by Sebastian Rodriguez on 4/4/22.
//

import Foundation
import Firebase

class Room: ObservableObject {
    @Published var rooms = [RoomItem]()
    private let db = Firestore.firestore()
    
    func createRoom(code: String, completion: @escaping() -> Void, failed: @escaping() -> Void) {
        db.collection("rooms").document(code).setData(["code" : code,
                                                       "users" : 1])
        { error in
            if let error = error {
                print("\(error)")
                failed()
            }
            else {
                completion()
            }
        }
    }
    
    func joinRoom(code: String, completion: @escaping() -> Void, failed: @escaping() -> Void) {
        db.collection("rooms").whereField("code", isEqualTo: code).getDocuments() { (snapshot, error) in
            for document in snapshot!.documents {
                self.db.collection("rooms").document(document.documentID).updateData(["users": FieldValue.increment(Int64(1))])
                completion()
                return
            }
            
            failed()
        }
    }
    
    func leaveRoom(code: String, completion: @escaping() -> Void) {
        db.collection("rooms").whereField("code", isEqualTo: code).getDocuments() { (snapshot, error) in
            for document in snapshot!.documents {
                self.db.collection("rooms").document(document.documentID).updateData(["users": FieldValue.increment(Int64(-1))])
                self.removeRoom(code: code)
                completion()
            }
        }
    }
    
    func removeRoom(code: String) {
        let database = db.collection("rooms").document(code)
        database.getDocument{(snapshot, error) in
            if let document = snapshot, document.exists {
                let data = document.get("users") ?? 0
                if data as! Int == 0 {
                    database.delete()
                }
            }
        }
    }
}

struct RoomItem: Codable {
    var code: Int
}
