//
//  FirebaseDecodable.swift
//  Chat
//
//  Created by Evgeny Matviyenko on 12/6/18.
//  Copyright © 2018 uptech. All rights reserved.
//

import FirebaseFirestore

protocol FirebaseDecodable {
    init?(id: String, firebaseDictionary: [String: Any])
}

extension DocumentSnapshot {
    func mapDocumentSnapshot<T>(to type: T.Type) -> T? where T: FirebaseDecodable {
        return data().flatMap { T(id: documentID, firebaseDictionary: $0) }
    }
}

extension Array where Element: DocumentSnapshot {
    func mapDocumentSnapshots<T>(toArrayOf type: T.Type) -> [T]? where T: FirebaseDecodable {
        let elements = compactMap { $0.mapDocumentSnapshot(to: type) }
        guard elements.count == count else {
            return nil
        }
        return elements
    }
}
