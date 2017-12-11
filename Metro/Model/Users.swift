//
//  Users.swift
//  Metro
//
//  Created by air on 13.11.2017.
//  Copyright © 2017 Nikita Kuratnik. All rights reserved.
//



import Foundation
import Firebase

struct Users {
    
    let uid:String
    let email:String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
    }

}

