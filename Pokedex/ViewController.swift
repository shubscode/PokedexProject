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
    var minAtkTextField: UITextField!
    var minDefTextField: UITextField!
    var minHpTextField: UITextField!
    
    var pokeName: String!
    var minAtk: Int!
    var minDef: Int!
    var minHp: Int!
    
    var search: UIButton!
    
    var scView:UIScrollView!
    let buttonPadding:CGFloat = 10
    var xOffset:CGFloat = 10
    var typesSelected = Set<String>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scView = UIScrollView(frame: CGRect(x: 0, y: 150, width: view.bounds.width, height: 50))
        view.addSubview(scView)
        
        scView.backgroundColor = UIColor.white
        scView.translatesAutoresizingMaskIntoConstraints = false
        
        for type in types {
            let button = UIButton()
            button.setTitle(type, for: .normal)
            button.backgroundColor = UIColor.darkGray
            button.layer.cornerRadius = 10
            button.clipsToBounds = true
            button.setTitle("\(type)", for: .normal)
            button.tag = types.index(of: type)!
            button.addTarget(self, action: #selector(typeSelect), for: .touchUpInside)
            
            button.frame = CGRect(x: xOffset, y: CGFloat(buttonPadding), width: 70, height: 30)
            
            xOffset = xOffset + CGFloat(buttonPadding) + button.frame.size.width
            scView.addSubview(button)
            
            
        }
        
        scView.contentSize = CGSize(width: xOffset, height: scView.frame.height)
        
        
        searchField = UITextField(frame: CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 50))
        searchField.placeholder = "Pokemon Name"
        searchField.borderStyle = .roundedRect
        searchField.clipsToBounds = true
        view.addSubview(searchField)
        
        minAtkTextField = UITextField(frame: CGRect(x: 20, y: 300, width: view.frame.width - 40, height: 50))
        minAtkTextField.placeholder = "Minimum Attack Points"
        minAtkTextField.borderStyle = .roundedRect
        minAtkTextField.clipsToBounds = true
        view.addSubview(minAtkTextField)
        
        minDefTextField = UITextField(frame: CGRect(x: 20, y: 400, width: view.frame.width - 40, height: 50))
        minDefTextField.placeholder = "Minimum Defense Points"
        minDefTextField.borderStyle = .roundedRect
        minDefTextField.clipsToBounds = true
        view.addSubview(minDefTextField)
        
        minHpTextField = UITextField(frame: CGRect(x: 20, y: 500, width: view.frame.width - 40, height: 50))
        minHpTextField.placeholder = "Minimum Health Points"
        minHpTextField.borderStyle = .roundedRect
        minHpTextField.clipsToBounds = true
        view.addSubview(minHpTextField)
        
        search = UIButton(frame: CGRect(x: 20, y: 600, width: view.frame.width - 40, height: 50))
        search.backgroundColor = UIColor.black
        search.setTitle("Search!", for: .normal)
        view.addSubview(search)
        search.addTarget(self, action: #selector(toSearch), for: .touchUpInside)
    }
    
    func readInputs() {
        if let name = searchField.text {
            pokeName = name
        }
        if let attack = minAtkTextField.text {
            if attack != "" {
                if let attack = Int(attack) {
                    minAtk = Int(attack)
                } else {
                    raiseInvalidTypeAlert(info: "Attack")
                }
            }
        }
        if let defense = minDefTextField.text {
            if defense != "" {
                if let defense = Int(defense) {
                    minDef = Int(defense)
                } else {
                    raiseInvalidTypeAlert(info: "Defense")
                }
            }
        }
        if let hp = minHpTextField.text {
            if hp != "" {
                if let hp = Int(hp) {
                    minHp = Int(hp)
                } else {
                    raiseInvalidTypeAlert(info: "Hitpoint")
                }
            }
            
        }
    }
    
    func raiseInvalidTypeAlert(info: String) {
        let alert = UIAlertController(title: "Invalid \(info) Information", message: "Please enter intger values for this field", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("hello")
        if segue.identifier == "toSearch" {
            if let destinationVC = segue.destination as? ListViewController {
                destinationVC.name = pokeName
                destinationVC.pokeType = typesSelected
                destinationVC.atk = minAtk
                destinationVC.def = minDef
                destinationVC.hp = minHp
            }
        }
    }
    
    @IBAction func toSearch (_ sender: Any) {
        readInputs()
        self.performSegue(withIdentifier: "toSearch", sender: sender)
        
    }
    
    @objc func typeSelect(sender: UIButton) {
        
        UIButton.animate(withDuration: 0.2,
                         animations: {
                            sender.transform = CGAffineTransform(scaleX: 0.975, y: 0.96)
        },
                         completion: { finish in
                            UIButton.animate(withDuration: 0.2, animations: {
                                sender.transform = CGAffineTransform.identity
                            })
        })
        
        sender.backgroundColor = .green
        let tag = sender.tag
        
        let type = tagToType(tagNumber: tag)
        typesSelected.insert(type)
        print(typesSelected)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

