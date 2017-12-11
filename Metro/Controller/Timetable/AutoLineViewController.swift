//
//  AutoLineViewController.swift
//  Metro
//
//  Created by air on 23.11.2017.
//  Copyright © 2017 Nikita Kuratnik. All rights reserved.
//

import UIKit

class AutoLineViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let autoLine = ["Каменная горка", "Кунцевщина", "Спортивная",
                    "Пушинская", "Молодежная", "Фрунзенская",
                    "Немига", "Купаловская", "Первомайская",
                    "Пролетарская", "Тракторный завод","Партизанская",
                    "Автозавовская", "Могилевская"]
    
    let timeTableTrain = ["22","31","33","1","1","1","1","1","1","1","1","1","1","1"]
    
    let imegeLine = "autoLine.svg"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autoLine.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AutoLineTableViewCell
        
        cell.labelCell.text = autoLine[indexPath.row]
        cell.ImageCell.image = UIImage(named: imegeLine)
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AutoLine"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let dvc = segue.destination as! AutoTimetableViewController
                dvc.stationName = self.autoLine[indexPath.row]
                dvc.timeTableTrain = timeTableTrain
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

}
