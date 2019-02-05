//
//  FirebaseEvent.swift
//  Chat
//
//  Created by Evgeny Matviyenko on 12/14/18.
//  Copyright © 2018 uptech. All rights reserved.
//

import FirebaseFirestore

struct FirebaseEvent: Hashable {
    var id: String
    var chatId: String
    var createdAt: Date
    var type: String
    var message: FirebaseMessage?
    var info: FirebaseInfo?
}

extension FirebaseEvent: FirebaseDecodable {
    init?(id: String, firebaseDictionary: [String : Any]) {
        guard
            let chatId = firebaseDictionary["chatId"] as? String,
            let createdAt = firebaseDictionary["createdAt"] as? Timestamp,
            let type = firebaseDictionary["type"] as? String
        else {
            return nil
        }

        self.id = id
        self.chatId = chatId
        self.createdAt = createdAt.dateValue()
        self.type = type
        let rawMessage = firebaseDictionary["message"] as? [String: Any]
        self.message = rawMessage.flatMap(FirebaseMessage.init)
        let rawInfo = firebaseDictionary["info"] as? [String: Any]
        self.info = rawInfo.flatMap(FirebaseInfo.init)
    }
}
