//
//  ApiInfo.swift
//  Chat
//
//  Created by Evgeny Matviyenko on 12/26/18.
//  Copyright © 2018 uptech. All rights reserved.
//

import Foundation

enum ApiInfo: Hashable {
    case createdChat(userId: String, name: String)
    case addedUser(whoId: String, whomId: String)
    case userLeft(userId: String)
    case renamedChat(userId: String, name: String)
}

extension ApiInfo {
    init?(firebaseInfo: FirebaseInfo) {
        switch firebaseInfo.type {
        case "createdChat":
            guard
                let userId = firebaseInfo.userId,
                let name = firebaseInfo.name
                else {
                    return nil
            }

            self = .createdChat(userId: userId, name: name)

        case "addedUser":
            guard
                let whoId = firebaseInfo.whoId,
                let whomId = firebaseInfo.whomId
                else {
                    return nil
            }

            self = .addedUser(whoId: whoId, whomId: whomId)

        case "userLeft":
            guard
                let userId = firebaseInfo.userId
                else {
                    return nil
            }

            self = .userLeft(userId: userId)

        case "renamedChat":
            guard
                let userId = firebaseInfo.userId,
                let name = firebaseInfo.name
                else {
                    return nil
            }

            self = .renamedChat(userId: userId, name: name)

        default:
            return nil
        }
    }
}
