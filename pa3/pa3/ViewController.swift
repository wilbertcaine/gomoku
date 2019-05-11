//
//  ViewController.swift
//  pa3
//
//  Created by wilbert caine on 10/5/2019.
//  Copyright © 2019 wilbert caine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var row: UITextField!
    @IBOutlet weak var column: UITextField!
    @IBAction func Play(_ sender: Any) {
        performSegue(withIdentifier: "play", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondController = segue.destination as! SecondViewController
        secondController.row = Int(row.text!)!
        secondController.column = Int(column.text!)!
    }


}

