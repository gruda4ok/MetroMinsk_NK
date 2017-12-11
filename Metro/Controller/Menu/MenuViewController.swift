//
//  MenuViewController.swift
//  Metro
//
//  Created by air on 10.11.2017.
//  Copyright © 2017 Nikita Kuratnik. All rights reserved.
//


//Мобильные приложения
//В диалоге "О программе" и упомянуть Icons8 в описании App Store или Google Play.

import UIKit
import Firebase

class MenuViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
  
    let menu: Array<String> = ["Билеты","Схема","Расписание"]
    let imageCell: Array<String> = ["ticket.png","map.png","timetable.png"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell" , for: indexPath) as! MenuTableViewCell
        cell.labelCell.text = menu[indexPath.row]
        cell.ImageCell.image = UIImage(named: imageCell[indexPath.row])
        cell.backgroundColor = .clear
            
    return cell
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            performSegue(withIdentifier: "TicketSegue", sender: nil)
        }
        if indexPath.row == 1{
            performSegue(withIdentifier: "ShemeSegue", sender: nil)
        }
        if indexPath.row == 2{
            performSegue(withIdentifier: "TimetableSegue", sender: nil)
        }
        
    }
    
    
    @IBAction func singOut(_ sender: UIBarButtonItem) {
        do{
          try Auth.auth().signOut()
        }catch{
            print(error.localizedDescription )
        }
        dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
     
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
