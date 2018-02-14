//
//  ListViewController.swift
//  Pokedex
//
//  Created by Fang on 2/13/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    var name: String?
    var pokeType = Set<String>()
    var atk: Int?
    var def: Int?
    var hp: Int?
    
    override func loadView() {
        super.loadView()
        let items = ["Grid", "List"]
        let sc = UISegmentedControl(items: items)
        sc.selectedSegmentIndex = 0
        
        sc.frame = CGRect(x: 25, y:80, width: view.frame.width-50, height: 40)
        
        sc.layer.cornerRadius = 5.0
        sc.backgroundColor = UIColor.black
        sc.tintColor = UIColor.white
        
        sc.addTarget(self, action: #selector(changeColor), for: .valueChanged)
        
        self.view.addSubview(sc)
        makeGrid()
    }
    
    func changeColor(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            makeList()
        default:
            makeGrid()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // renders collectionView
    func makeGrid() {
        self.view.backgroundColor = UIColor.purple
    }
    
    // renders tableView
    func makeList() {
        self.view.backgroundColor = UIColor.green
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
