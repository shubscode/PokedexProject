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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func toSearch (_ sender: Any) {
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

