//
//  ApiEvent.swift
//  Chat
//
//  Created by Evgeny Matviyenko on 12/14/18.
//  Copyright © 2018 uptech. All rights reserved.
//

import Foundation

struct ApiEvent: Hashable {
    enum Content: Hashable {
        case info(ApiInfo)
        case message(FirebaseMessage)
    }

    var id: String
    var chatId: String
    var createdAt: Date
    var content: Content
}

extension ApiEvent {
    init?(firebaseEvent: FirebaseEvent) {
        self.id = firebaseEvent.id
        self.chatId = firebaseEvent.chatId
        self.createdAt = firebaseEvent.createdAt

        switch firebaseEvent.type {
        case "info":
            guard let firebaseInfo = firebaseEvent.info, let info = ApiInfo(firebaseInfo: firebaseInfo) else {
                return nil
            }
            self.content = .info(info)

        case "message":
            guard let message = firebaseEvent.message else {
                return nil
            }
            self.content = .message(message)

        default:
            return nil
        }
    }
}

