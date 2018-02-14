//
//  ListViewController.swift
//  Pokedex
//
//  Created by Fang on 2/13/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    
    override func loadView() {
        super.loadView()
        let items = ["Grid", "List"]
        let sc = UISegmentedControl(frame: CGRect(x: view.frame.width/2-62, y:50, width: view.frame.width-40, height: 50))
        
        (items: items)
        sc.selectedSegmentIndex = 0
        
//        let frame = UIScreen.main.bounds
//        sc.frame = CGRect(
//
//        (frame:frame.minX + 10, frame.minY + 50,
//                                    frame.width - 20, frame.height*0.1)
        
        sc.layer.cornerRadius = 5.0
        sc.backgroundColor = UIColor.black
        sc.tintColor = UIColor.white
        
        sc.addTarget(self, action: #selector(changeColor), for: .valueChanged)
        self.view.addSubview(sc)


        
        
        self.view.backgroundColor = UIColor.purple
    }
    
    func changeColor(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            self.view.backgroundColor = UIColor.green
        case 2:
            self.view.backgroundColor = UIColor.blue
        default:
            self.view.backgroundColor = UIColor.purple
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
