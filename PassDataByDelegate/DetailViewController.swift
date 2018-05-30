//
//  ViewController.swift
//  PassDataByDelegate
//
//  Created by Son on 5/14/18.
//  Copyright © 2018 Son. All rights reserved.
//

import UIKit
protocol DetailViewControllerDelegate : class {
    func passingData(number : Int)
}
class DetailViewController: UIViewController {
    @IBOutlet weak var nameText: UITextField!
    
    var number : Int?
    var delegate : DetailViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        if number != nil{
            nameText.text = String(number!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveTo (_ sender : UIBarButtonItem){
        delegate?.passingData(number: Int(nameText.text ?? "") ?? 0)
        navigationController?.popViewController(animated: true)
    }

}
