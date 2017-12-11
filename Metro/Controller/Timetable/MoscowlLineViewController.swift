//
//  MockowlLineViewController.swift
//  Metro
//
//  Created by air on 23.11.2017.
//  Copyright © 2017 Nikita Kuratnik. All rights reserved.
//

import UIKit

class MoscowlLineViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let moscowLine: Array<String> = ["Уручье", "Борисовский тракт","Восток",
                                     "Московская", "Парк Челюскинцев" ,"Академия наук",
                                     "Площадь Якуба Колоса", "Площадь победы", "Октяборьская",
                                     "Площадь Ленина", "Институт культуры", "Грушевка",
                                     "Михалова", "Петровщина", "Малиновка"]
    
    let imageLine = "moscowLine.svg"
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moscowLine.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MoscokLineTableViewCell
        
        cell.labelCell.text = moscowLine[indexPath.row]
        cell.ImageCell.image = UIImage(named: imageLine)
        
        return cell
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
         tableView.tableFooterView = UIView()

    }
}
