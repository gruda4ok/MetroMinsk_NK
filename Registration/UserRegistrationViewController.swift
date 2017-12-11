//
//  UserRegistrationViewController.swift
//  Metro
//
//  Created by air on 10.11.2017.
//  Copyright © 2017 Nikita Kuratnik. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class UserRegistrationViewController: UIViewController, UITextFieldDelegate , FBSDKLoginButtonDelegate{
    
    
    //Мобильные приложения
    //В диалоге "О программе" и упомянуть Icons8 в описании App Store или Google Play.
    var ref: DatabaseReference!
    
    
    @IBOutlet weak var warnLabel: UILabel!
    
    @IBOutlet weak var emailTextFild: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButtonFB = FBSDKLoginButton()
        view.addSubview(loginButtonFB)
        loginButtonFB.frame = CGRect(x: 16, y: 50, width: view.frame.width - 32, height: 50)
        loginButtonFB.delegate = self
       
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dissmisText))
        emailTextFild.delegate = self
        passwordTextField.delegate = self
        view.addGestureRecognizer(tapGesture)
        
        
        ref = Database.database().reference(withPath: "users")
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardDidShow), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardDidHide), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
        
        warnLabel.alpha = 0
        
        Auth.auth().addStateDidChangeListener { [weak self](auth, user) in
            if user != nil{
                self?.performSegue(withIdentifier: "menuSegue", sender: nil)
            }
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        emailTextFild.text = ""
        passwordTextField.text = ""
    }
    
    @objc func keyBoardDidShow(notification: Notification){
        guard let userInfo = notification.userInfo else {return}
        let keyBoardFrameSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue ).cgRectValue
    
        (self.view as! UIScrollView).setContentOffset(CGPoint(x:0,y:keyBoardFrameSize.height - 100), animated: true)

    }
    
    
    @objc func keyBoardDidHide(){
        (self.view as! UIScrollView).setContentOffset(CGPoint(x:0,y:0), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextFild.endEditing(true)
        passwordTextField.endEditing(true)
        
        return true
    }
    
    @objc func dissmisText(){
        emailTextFild.endEditing(true)
        passwordTextField.endEditing(true)
    }
    

    func displayWarnigLabel(withText text: String){
        warnLabel.text = text
        UIView.animate(withDuration: 3, delay: 0, options: .curveLinear, animations: { [weak self ] in
            self?.warnLabel.alpha = 1
        }) { [weak self] complete  in
            self?.warnLabel.alpha = 0
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    @IBAction func loginButton(_ sender: UIButton) {
        guard let email = emailTextFild.text, let password = passwordTextField.text, email != "",password != "" else {
            displayWarnigLabel(withText: "Info is incorrecy")
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] ( user, error) in
            if error != nil{
                self?.displayWarnigLabel(withText: "Error occured")
    
                return
            }
            if user != nil{
                self?.performSegue(withIdentifier: "menuSegue", sender: nil)
                return
            }
            self?.displayWarnigLabel(withText: "No such user")
        }
    }
   
    @IBAction func registrationButton(_ sender: UIButton) {
        guard let email = emailTextFild.text, let password = passwordTextField.text, email != "",password != "" else {
            displayWarnigLabel(withText: "Info is incorrecy")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
        
            guard error == nil, user != nil else {
                print(error!.localizedDescription )
                return
            }
            let userRef = self.ref.child((user?.uid)!)
            userRef.setValue(["email": user?.email])
        }
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {

        let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        Auth.auth().signIn(with: credential) { (user, error) in

        }
        print("Succsesslly loggned in with facebook")
    }

    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of facebook")
    }
    
    
}

//fileprivate extension UserRegistrationViewController {
//    func loginWithCredentials(credentials: AuthCredential, type: String) {
//        Auth.auth().signIn(with: credentials) { [weak self] (user, error) in
//            guard let strongSelf = self else { return }
//            if let loginError = error {
//                print("Failed to login to Firebase via \(type): \(loginError)")
//               ,,,, return
//            }
//            let reference = Database.database().reference().child("users")
//            reference.observe(.value, with: { (snapshot) in
//                let dict = snapshot.value as! NSDictionary
//                let keys = dict.allKeys as! [String]
//                guard let userKey = user?.uid else { return }
//                var isRegisteredInDBBefore = false
//                for key in keys {
//                    if userKey == key {
//                        isRegisteredInDBBefore = true
//                        break
//                    }
//                }
//
//                if isRegisteredInDBBefore {
//                    strongSelf.dismiss(animated: true, completion: nil)
//                } else {
//                    switch type {
//                    case "Facebook":
//                        strongSelf.facebookLogin(userKey: userKey)
//                    default:
//                        break
//                    }
//                }
//
//            }, withCancel: nil)
//        }
//    }
//    func facebookLogin(userKey: String) {
//        var values = [String: AnyObject]()
//        let imageURL = FBSDKProfile.current().imageURL(for: .square,
//                                                       size: CGSize(width: 100, height: 100))
//        let userName = FBSDKProfile.current().name
//        let userLink = FBSDKProfile.current().linkURL
//        let image = String(describing: imageURL!)
//        let name = userName!
//        let link = String(describing: userLink!)
//        values = [
//            "name" : name as AnyObject,
//            "email" : link as AnyObject,
//            "profileImageURL" : image as AnyObject
//        ]
//        
//        self.registerUserIntoDatabase(uid: userKey, values: values)
//    }
//    
//    func registerUserIntoDatabase(uid: String, values: [String : AnyObject]) {
//        let reference = Database.database().reference()
//        let usersReference = reference.child("users").child(uid)
//        usersReference.updateChildValues(values, withCompletionBlock: {[weak self] (err, ref) in
//
//            if err != nil {
//                print(err!)
//                return
//            }
//
//            guard let strongSelf = self else { return }
//            let user = User(dictionary: values)
//
//            strongSelf.loginButtinFB.animate(1, completion: {
//                strongSelf.messagesController?.setupNavBarWithUser(user: user)
//                self?.dismiss(animated: false, completion: nil)
//            })
//        })
//    }
//}
//
//extension UserRegistrationViewController: FBSDKLoginButtonDelegate {
//    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
//        if let errorMessage = error {
//            print(errorMessage)
//            return
//        }
//
//        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields" : "id, name, picture.type(large), link, email"]).start { (connection, result, err) in
//            if let error = err {
//                print("Failed to start graph request: \(error)")
//                return
//            }
//        }
//
//        let accessToken = FBSDKAccessToken.current()
//
//        guard let accessTokenString = accessToken?.tokenString else {
//            print("Can't get access token")
//            return
//        }
//
//        FBSDKProfile.loadCurrentProfile { (profile, error) in
//            if let loadingError = error {
//                print(loadingError)
//                return
//            }
//        }
//
//        let credentials = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
//        loginWithCredentials(credentials: credentials, type: "Facebook")
//    }
//
//    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
//        print("logout")
//    }
//}
//

