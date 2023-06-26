//
//  ExistedUsers.swift
//  School Application
//
//  Created by Thai Huy on 18/06/2023.
//

import Foundation

final class ExistedUsers {
    var listOfUsers: [User] = {
        var list: [User] = [
        User(account: "thaihuy836@gmail.com", password: "12345"),
        User(account: "thaihuy", password: "1234"),
        User(account: "thaihoanghuy", password: "1234567890")
        ]
        return list
    }()
    
    public func doesContainUser(user: User) -> Bool {
        for i in listOfUsers where i.account == user.account && i.password == user.password {
            return true
        }
        return false
    }
}
