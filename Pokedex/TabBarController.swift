//
//  TabBarController.swift
//  Pokedex
//
//  Created by Fang on 2/15/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    var pokemonHolder: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tab1 = PokemonInfoViewController()
        tab1.pokemonSelected = pokemonHolder
        let tab2 = FavoritesViewController()
        
        self.viewControllers = [tab1, tab2]
        
        tab1.tabBarItem = UITabBarItem(title: "Favorites", image: nil, tag: 0)
        tab2.tabBarItem = UITabBarItem(title: "Pokefile", image: nil, tag: 1)
        
        
        // Do any additional setup after loading the view.
    }

   

}
