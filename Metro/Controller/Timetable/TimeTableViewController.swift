//
//  TimeTableViewController.swift
//  Metro
//
//  Created by air on 16.11.2017.
//  Copyright © 2017 Nikita Kuratnik. All rights reserved.
//

import UIKit


class TimeTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    
    @IBOutlet weak var tableView: UITableView!
    
    let lineMetro: Array<String> = ["Автозаводская линия","Московская линия"]
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lineMetro.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = lineMetro[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            performSegue(withIdentifier: "AutomotiveLine", sender: nil)
        }
        if indexPath.row == 1{
            performSegue(withIdentifier: "MoscowLine", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
   
}

