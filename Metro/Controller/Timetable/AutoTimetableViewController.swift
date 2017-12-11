//
//  AutoTimetableTableViewCell.swift
//  Metro
//
//  Created by air on 23.11.2017.
//  Copyright © 2017 Nikita Kuratnik. All rights reserved.
//

import UIKit

class AutoTimetableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var StationLabel: UILabel!
    var stationName = ""
    var timer = 10
    var intervalTimer: Timer!
    var timeTableTrain: Array<String> = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeTableTrain.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = timeTableTrain[indexPath.row]
        
        return cell
    }
    
    
    // MARK: Timer
    @objc func runTimedCode(){
        print("4")
    }
    
    @objc func action(){
        timer -= 1
        if timer == 0{
            timer = 10
        }
        StationLabel.text = String(timer)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StationLabel.text = stationName
        intervalTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(AutoTimetableViewController.action), userInfo: nil, repeats: true)

    }
    
}


