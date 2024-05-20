//
//  User.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 30.04.2024.
//

import Foundation

struct User: Codable {
    var name: String
    var surname: String
    var email: String
    var dateOfBirth: Date
    var gender: String
    var profilePhoto: Data?
}

extension UserEntity {
    func toUser() -> User {
        return User(name: name ?? "",
                    surname: surname ?? "",
                    email: email ?? "",
                    dateOfBirth: dateOfBirth ?? Date(),
                    gender: gender ?? "",
                    profilePhoto: profilePhoto)
    }
    
    func update(from user: User) {
        self.name = user.name
        self.surname = user.surname
        self.email = user.email
        self.dateOfBirth = user.dateOfBirth
        self.gender = user.gender
        self.profilePhoto = user.profilePhoto
    }
}

