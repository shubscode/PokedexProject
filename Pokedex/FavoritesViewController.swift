//
//  FavoritesViewController.swift
//  Pokedex
//
//  Created by Shubham Gupta on 2/14/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var tableView: UITableView!
    var titleLabel: UILabel!

    var customPurple2 =  UIColor(red: 0.5176, green: 0.4392, blue: 0.9569, alpha: 1.0)

    override func viewDidLoad() {
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 50, width: view.bounds.width, height: 120))
        titleLabel.text = "My Favorites"
        titleLabel.font = titleLabel.font.withSize(60)
        titleLabel.textColor = customPurple2
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        
       
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView = UITableView(frame: CGRect(x: 30, y:160, width: view.frame.width - 60, height: view.frame.height),
                                style: UITableViewStyle.plain)
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: "poke")
        tableView.backgroundColor = UIColor.white
        tableView.clipsToBounds = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        super.viewDidAppear(true);
    }
    
    override func loadView() {
        view = UIView()
        view.frame = UIScreen.main.bounds
        setBackground()
    }
    
    func setBackground() {
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "pokeBackground.png")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }

}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    // specifying number of sections in the CV
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritePokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "poke", for: indexPath)
            as! PokemonTableViewCell
        
        cell.awakeFromNib()
        

        
        let image = favoritePokemon[indexPath.row].getImageFromURL()
        print(image)
        cell.pokeImageView.image = image
        cell.name.text = favoritePokemon[indexPath.row].name
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
