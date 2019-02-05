//
//  FirebaseInfo.swift
//  Chat
//
//  Created by Evgeny Matviyenko on 12/26/18.
//  Copyright © 2018 uptech. All rights reserved.
//

import Foundation

struct FirebaseInfo: Hashable {
    let type: String
    let userId: String?
    let name: String?
    let whoId: String?
    let whomId: String?
}

extension FirebaseInfo {
    init?(firebaseDictionary: [String : Any]) {
        guard let type = firebaseDictionary["type"] as? String else {
            return nil
        }

        self.type = type
        self.userId = firebaseDictionary["userId"] as? String
        self.name = firebaseDictionary["name"] as? String
        self.whoId = firebaseDictionary["whoId"] as? String
        self.whomId = firebaseDictionary["whomId"] as? String
    }
}
