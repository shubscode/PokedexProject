//
//  FavoritesViewController.swift
//  Pokedex
//
//  Created by Shubham Gupta on 2/14/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

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
        
        
        //        for sv in cell.contentView.subviews {
        //            sv.removefromSuperview()
        //        }
        
        var image = favoritePokemon[indexPath.row].getImageFromURL()
        print(image)
        cell.pokeImageView.image = image
        cell.name.text = favoritePokemon[indexPath.row].name
        
        print("I added images to tableview")
        return cell
    }
    
    //    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    //        let pokeCell = cell as! PokemonTableViewCell
    //        pokeCell.pokeImageView.image = filteredPokemon[indexPath.row]
    //        pokeCell.name.text = filteredPokemonInfo[indexPath.row].name
    //    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
