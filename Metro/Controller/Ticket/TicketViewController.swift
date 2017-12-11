//
//  TicketViewController.swift
//  Metro
//
//  Created by air on 12.11.2017.
//  Copyright © 2017 Nikita Kuratnik. All rights reserved.
//


//Мобильные приложения
//В диалоге "О программе" и упомянуть Icons8 в описании App Store или Google Play.

import UIKit
import Firebase
import PassKit
import CoreData

 
class TicketViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,PKPaymentAuthorizationViewControllerDelegate{
   
    
    var paymentRequest: PKPaymentRequest!
    var user: Users!
    var ref: DatabaseReference!
    var ticket = Array<Ticket>()
    var ticketId: String? 
    var ticketTitle: String = ""
    
    @IBOutlet weak var ticketTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ticketTableView.tableFooterView = UIView()
    
        guard let currentUser = Auth.auth().currentUser else { return }

        user = Users(user: currentUser)
        ref = Database.database().reference(withPath: "users").child(String(user.uid)).child("tickets")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ticketId = String(arc4random_uniform(100)) + user.uid
        ref.observe(.value) { [weak self](snapshot) in
            var _ticket = Array<Ticket>()
            for item in snapshot.children{
                let ticked = Ticket(snapshot: item as! DataSnapshot)
                _ticket.append(ticked)
            }
            self?.ticket = _ticket
            self?.ticketTableView.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        ref.removeAllObservers()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ticket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTicket", for: indexPath)
        cell.backgroundColor = .clear
        let ticketTitle = ticket[indexPath.row].ticketId
        //cell.textLabel?.text =  "Билет" + String(indexPath.row + 1)
        cell.textLabel?.text = ticketTitle
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        ticketTitle = ticket[indexPath.row].ticketId
        performSegue(withIdentifier: "byeTicketSegue", sender: nil)

    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let ticked = ticket[indexPath.row]
            ticked.ref.removeValue()
        }
        
    }
    
    
    func itemBye(shippung: Double)-> [PKPaymentSummaryItem]{
        let ticketPrice = PKPaymentSummaryItem(label: "Минский метрополитен", amount: 0.70)
        
        return [ticketPrice]
    }
    
   @IBAction func addTapped(_ sender: UIBarButtonItem) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self  else { return }
            let paymentNetworks = [PKPaymentNetwork.visa , .masterCard]
        
            if PKPaymentAuthorizationViewController.canMakePayments(usingNetworks: paymentNetworks){
            
                strongSelf.paymentRequest = PKPaymentRequest()
                strongSelf.paymentRequest.countryCode = "RU"
                strongSelf.paymentRequest.currencyCode = "RUB"
                strongSelf.paymentRequest.merchantIdentifier  = "merchant.it-academy.MetroMinska"
                strongSelf.paymentRequest.supportedNetworks = paymentNetworks
                strongSelf.paymentRequest.merchantCapabilities = .capability3DS
                strongSelf.paymentRequest.paymentSummaryItems = strongSelf.itemBye(shippung: 0.70)
            
                let applePayVC = PKPaymentAuthorizationViewController(paymentRequest: strongSelf.paymentRequest)
                applePayVC?.delegate = self
            
                strongSelf.present(applePayVC!, animated: true, completion: nil)
            
            }else{
                
                let warning = UIAlertController(title: "Warning", message: "You don't have card", preferredStyle: .alert)
                let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
            
                warning.addAction(ok)
                strongSelf.present(warning, animated: true, completion: nil)
            
                print("warning")
            }
        }
    
    }
    
    
    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, completion: @escaping (PKPaymentAuthorizationStatus) -> Void) {
        
        let ticket = Ticket(ticketId: (self.ticketId!), userId: (self.user.uid))
        let tickedRef = self.ref.child(ticket.ticketId.lowercased())
        tickedRef.setValue(ticket.convertToDictionary())
        completion(PKPaymentAuthorizationStatus.success)
        
    }
    
    
    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "byeTicketSegue"{
            let dvc = segue.destination as! ViewController
            dvc.ticketId = ticketTitle
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

