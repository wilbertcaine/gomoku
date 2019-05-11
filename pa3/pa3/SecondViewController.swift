//
//  SecondViewController.swift
//  pa3
//
//  Created by wilbert caine on 10/5/2019.
//  Copyright © 2019 wilbert caine. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var p = 1
    var s = ""
    var x=0, o=0
    var a=0
    var row = 0, column = 0
    
    @IBOutlet weak var winner: UILabel!
    @IBOutlet var result: UIView!
    @IBOutlet var button: [UIButton]!
    @IBOutlet weak var state: UILabel!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        a-=1
        sender.isEnabled = false
        if (p==1){
            s = "X"
            sender.setTitle("X", for: .normal)
            sender.setTitleColor(.red, for: .normal)
        }
        else{
            s = "O"
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(.black, for: .normal)
        }
        for i in 1...9{
            x = 0
            o = 0
            for j in 1...9{
                if button?[i*10+j-10-i].currentTitle == "X" {
                    x+=1
                    o=0
                }
                else if button?[i*10+j-10-i].currentTitle == "O" {
                    o+=1
                    x=0
                }
                else{
                    x=0
                    o=0
                }
                if (x>=5 || o>=5){
                    if x>=5{
                        winner.text = "The winner is player 1 !!!"
                    }
                    else{
                        winner.text = "The winner is player 2 !!!"
                    }
                    for i in 1...9{
                        for j in 1...9{
                            if (i<=row && j<=column){
                                button?[i*10+j-10-i].isEnabled = false
                            }
                        }
                    }
                    self.view.addSubview(result)
                    result.center = self.view.center
                }
            }
        }
        for j in 1...9{
            x = 0
            o = 0
            for i in 1...9{
                if button?[i*10+j-10-i].currentTitle == "X" {
                    x+=1
                    o=0
                }
                else if button?[i*10+j-10-i].currentTitle == "O" {
                    o+=1
                    x=0
                }
                else{
                    x=0
                    o=0
                }
                if (x>=5 || o>=5){
                    if x>=5{
                        winner.text = "The winner is player 1 !!!"
                    }
                    else{
                        winner.text = "The winner is player 2 !!!"
                    }
                    for i in 1...9{
                        for j in 1...9{
                            if (i>row || j>column){
                                button?[i*10+j-10-i].isEnabled = false
                            }
                        }
                    }
                    self.view.addSubview(result)
                    result.center = self.view.center
                }
            }
        }
        for j in 1...9{
            x = 0
            o = 0
            for i in 1...9{
                var i2=i
                var j2=j
                while i2*10+j2<100{
                    if button?[i2*10+j2-10-i2].currentTitle == "X" {
                        x+=1
                        o=0
                    }
                    else if button?[i2*10+j2-10-i2].currentTitle == "O" {
                        o+=1
                        x=0
                    }
                    else{
                        x=0
                        o=0
                    }
                    if (x>=5 || o>=5){
                        if x>=5{
                            winner.text = "The winner is player 1 !!!"
                        }
                        else{
                            winner.text = "The winner is player 2 !!!"
                        }
                        for i in 1...9{
                            for j in 1...9{
                                if (i>row || j>column){
                                    button?[i2*10+j2-10-i2].isEnabled = false
                                }
                            }
                        }
                        self.view.addSubview(result)
                        result.center = self.view.center
                    }
                    i2+=1
                    j2+=1
                }
            }
            for j in 1...9{
                x = 0
                o = 0
                for i in 1...9{
                    var i2=i
                    var j2=j
                    while i2>0 && j2<10{
                        if button?[i2*10+j2-10-i2].currentTitle == "X" {
                            x+=1
                            o=0
                        }
                        else if button?[i2*10+j2-10-i2].currentTitle == "O" {
                            o+=1
                            x=0
                        }
                        else{
                            x=0
                            o=0
                        }
                        if (x>=5 || o>=5){
                            if x>=5{
                                winner.text = "The winner is player 1 !!!"
                            }
                            else{
                                winner.text = "The winner is player 2 !!!"
                            }
                            for i in 1...9{
                                for j in 1...9{
                                    if (i>row || j>column){
                                        button?[i2*10+j2-10-i2].isEnabled = false
                                    }
                                }
                            }
                            self.view.addSubview(result)
                            result.center = self.view.center
                        }
                        i2-=1
                        j2+=1
                    }
                }
        }
        if a==0{
            winner.text = "Draw !!!"
            self.view.addSubview(result)
            result.center = self.view.center
        }
        state.text = "player " + String(p) + ": " + s
        p = 3 - p
    }
    }
    
    @IBAction func replay(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        state.text = "player " + String(p) + ": X"
        // Do any additional setup after loading the view.
        for i in 1...9{
            for j in 1...9{
                if (i>row || j>column){
                    button?[i*10+j-10-i].isEnabled = false
                }
                else{
                    a+=1
                }
            }
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
