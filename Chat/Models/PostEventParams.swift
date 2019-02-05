//
//  PostEventParams.swift
//  Chat
//
//  Created by Evgeny Matviyenko on 12/12/18.
//  Copyright © 2018 uptech. All rights reserved.
//

import Foundation

struct PostEventParams {
    enum Content {
        case info(ApiInfo)
        case message(body: String, fromUserId: String)
    }

    var uuid: String
    var chatId: String
    var content: Content
}
