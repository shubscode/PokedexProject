//
//  ViewController.swift
//  Pokedex
//
//  Created by SAMEER SURESH on 9/25/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var searchField: UITextField!
    // ScrollView
    var minAtk: UITextField!
    var minDef: UITextField!
    var minHp: UITextField!
    
    var search: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchField = UITextField(frame: CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 50))
        searchField.placeholder = "Pokemon Name"
        searchField.borderStyle = .roundedRect
        searchField.clipsToBounds = true
        view.addSubview(searchField)
        
        minAtk = UITextField(frame: CGRect(x: 20, y: 300, width: view.frame.width - 40, height: 50))
        minAtk.placeholder = "Minimum Attack Points"
        minAtk.borderStyle = .roundedRect
        minAtk.clipsToBounds = true
        view.addSubview(minAtk)
        
        minDef = UITextField(frame: CGRect(x: 20, y: 400, width: view.frame.width - 40, height: 50))
        minDef.placeholder = "Minimum Defense Points"
        minDef.borderStyle = .roundedRect
        minDef.clipsToBounds = true
        view.addSubview(minDef)
        
        minHp = UITextField(frame: CGRect(x: 20, y: 500, width: view.frame.width - 40, height: 50))
        minHp.placeholder = "Minimum Health Points"
        minHp.borderStyle = .roundedRect
        minHp.clipsToBounds = true
        view.addSubview(minHp)
        
        search = UIButton(frame: CGRect(x: 20, y: 600, width: view.frame.width - 40, height: 50))
        search.backgroundColor = UIColor.black
        search.setTitle("Search!", for: .normal)
        view.addSubview(search)
        search.addTarget(self, action: #selector(toSearch), for: .touchUpInside)
    }
    
    
    @IBAction func toSearch (_ sender: Any) {
        self.performSegue(withIdentifier: "toSearch", sender: sender)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

