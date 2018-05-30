//
//  MasterTableViewController.swift
//  PassDataByDelegate
//
//  Created by Son on 5/14/18.
//  Copyright © 2018 Son. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController , DetailViewControllerDelegate {
    func passingData(number: Int) {
        if let index = tableView.indexPathForSelectedRow{
            arrNumber[index.row] = number
        } else{
            arrNumber.append(number)
        }
        tableView.reloadData()
    }
    
    var arrNumber = Array(1...3)
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        

    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
       
    }

   

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return arrNumber.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = String(arrNumber[indexPath.row])
        // Configure the cell...

        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailviewcontroller = segue.destination as? DetailViewController{
            if let index = tableView.indexPathForSelectedRow{
                detailviewcontroller.number = arrNumber[index.row]
            }
            detailviewcontroller.delegate = self
        }
    }
    
}
