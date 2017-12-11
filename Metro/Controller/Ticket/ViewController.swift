//
//  ViewController.swift
//  Metro
//
//  Created by air on 03.11.2017.
//  Copyright © 2017 Nikita Kuratnik. All rights reserved.
//


//Мобильные приложения
//В диалоге "О программе" и упомянуть Icons8 в описании App Store или Google Play.

import UIKit
import FirebaseDatabase
import Firebase


class ViewController: UIViewController {
    
    var user: Users!
    var ref: DatabaseReference!
    var id: String?
    var ticketId: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let currentUser = Auth.auth().currentUser else {return}
        user = Users(user: currentUser)
        ref = Database.database().reference(withPath: "users").child(String(user.uid)).child("tickets")
    
        qrCodeImage.image = qrcodeGenerator()
    }
    
   
    @IBOutlet weak var qrCodeImage: UIImageView!

    func qrcodeGenerator() -> UIImage {
        let myString = ticketId
        let data = myString.data(using: .ascii, allowLossyConversion: true)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let img = UIImage(ciImage: (filter?.outputImage?.transformed(by: transform))!)
        qrCodeImage.image = img
        
        return img
        
    }
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

