//
//  Ticket.swift
//  Metro
//
//  Created by air on 12.11.2017.
//  Copyright © 2017 Nikita Kuratnik. All rights reserved.
//

import Foundation
import Firebase

struct Ticket {
    let ticketId: String
    let userId: String
    let ref: DatabaseReference!
    
    init(ticketId:String, userId: String) {
        self.ticketId = ticketId
        self.userId = userId
        self.ref = nil
        
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        ticketId = snapshotValue["ticketId"] as! String
        userId = snapshotValue["userId"] as! String
        ref = snapshot.ref
    }
    
    func convertToDictionary() -> Any {
        return ["ticketId": ticketId, "userId": userId]
    }
    
}
 
