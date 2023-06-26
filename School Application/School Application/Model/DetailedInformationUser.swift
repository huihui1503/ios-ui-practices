//
//  DetailedInformationUser.swift
//  School Application
//
//  Created by Huy Thai on 26/06/2023.
//

import Foundation

struct DetailedInformationUser {
    let id: String
    var fullName: String
    var age: UInt
    var major: String
    var dob: Date
    
    var enrolledCourses: [Course] = []
}
