//
//  UserDatabase.swift
//  School Application
//
//  Created by Huy Thai on 26/06/2023.
//

import Foundation

final class UserDatabase {
    var listOfUsers: [DetailedInformationUser] = {
        var list = [
            DetailedInformationUser(
                id: "thaihuy+1234",
                fullName: "Thai Hoang Huy",
                age: 21,
                major: "Computer Science",
                dob: Date(),
                enrolledCourses: [Course(id: "123", name: "MVVM", describer: "The architecture")])
        ]
        return list
    }()
    
    public func doesContainUser(user: User) -> DetailedInformationUser? {
        let id = user.account + "+" + user.password
        for i in listOfUsers where  id == i.id {
            return i
        }
        return nil
    }
}
