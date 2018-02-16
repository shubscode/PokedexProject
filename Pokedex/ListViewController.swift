//
//  ListViewController.swift
//  Pokedex
//
//  Created by Fang on 2/13/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    //data storage from parameters screen
    var name: String?
    var pokeType = Set<String>()
    var atk: Int?
    var def: Int?
    var hp: Int?
    
    var collectionView: UICollectionView!
    var tableView: UITableView!
    var sc: UISegmentedControl!
    
    var filteredPokemonInfo = [Pokemon]()
    var thePokemon: Pokemon!

    var randomlyGenerated = false
    
    var indexSelected: Int!
    
    func changeView(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            makeList()
        default:
            makeGrid()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !randomlyGenerated {
            filteredPokemonInfo = filterPokemon(name: name, typeFilter: pokeType, minAtk: atk, minDef: def, minHP: hp)
        }
        
        print("Load Count: \(filteredPokemonInfo.count)")
        
        super.loadView()
        let items = ["Grid", "List"]
        sc = UISegmentedControl(items: items)
        sc.selectedSegmentIndex = 0
        
        sc.frame = CGRect(x: 25, y:80, width: view.frame.width-50, height: 40)
        
        sc.layer.cornerRadius = 5.0
        sc.backgroundColor = UIColor.black
        sc.tintColor = UIColor.white
        
        sc.addTarget(self, action: #selector(changeView), for: .valueChanged)
        
        self.view.addSubview(sc)
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView = UICollectionView(frame: CGRect(x: 0, y:135, width: view.frame.width, height: view.frame.height-135),
                                          collectionViewLayout: layout)
        collectionView.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: "poke")
        collectionView.backgroundColor = UIColor.white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        view.addSubview(sc)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /***********************************************************************************************************/
    /************************************* SETS UP COLLECTION VIEW *********************************************/
    /***********************************************************************************************************/
    func makeGrid() {
        tableView.removeFromSuperview()
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView = UICollectionView(frame: CGRect(x: 0, y:135, width: view.frame.width, height: view.frame.height-135),
                                          collectionViewLayout: layout)
        collectionView.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: "poke")
        collectionView.backgroundColor = UIColor.white
        collectionView.clipsToBounds = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
    }
    
    /***********************************************************************************************************/
    /****************************************** SETS UP TABLE VIEW *********************************************/
    /***********************************************************************************************************/
    func makeList() {
        collectionView.removeFromSuperview()
        
        tableView = UITableView(frame: CGRect(x: 0, y:135, width: view.frame.width, height: view.frame.height-135),
                                style: UITableViewStyle.plain)
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: "poke")
        tableView.backgroundColor = UIColor.white
        tableView.clipsToBounds = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
    }
    /***********************************************************************************************************/

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProfile" {
            let VC = segue.destination as! TabBarController
            VC.pokemonHolder = filteredPokemonInfo[indexSelected]
        }
    }
}


/***********************************************************************************************************/
/********************************************* COLLECTION VIEW *********************************************/
/***********************************************************************************************************/


extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout{
    
    // specifying number of sections in the CV
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // specifying number of cells in the given section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredPokemonInfo.count
    }
    
    // use this method to dequeue the cell and set it up
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "poke", for: indexPath)
            as!PokemonCollectionViewCell
        cell.awakeFromNib()
        
        cell.pokeImageView.image = filteredPokemonInfo[indexPath.row].getImageFromURL()
        cell.name.text = filteredPokemonInfo[indexPath.row].name
        return cell
    }
    
//    // use this method to populate the data of a given cell
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        let pokeCell = cell as! PokemonCollectionViewCell
//        //print(filteredPokemon[indexPath.row])
//        //pokeCell.pokeImageView.image = filteredPokemon[indexPath.row]
////        pokeCell.pokeImageView.image = filteredPokemonInfo[indexPath.row].getImageFromURL()
////        print("tried to get image")
////        pokeCell.name.text = filteredPokemonInfo[indexPath.row].name
////        print("assigned name")
//    }
    
    // sets the size of the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/3, height:100)
        
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        indexSelected = indexPath.row
        print(indexSelected)
        self.performSegue(withIdentifier: "toProfile", sender: self)
    }
    
}


/***********************************************************************************************************/
/********************************************* TABLE VIEW *********************************************/
/***********************************************************************************************************/


extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // specifying number of sections in the CV
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPokemonInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "poke", for: indexPath)
            as! PokemonTableViewCell
        cell.awakeFromNib()
        
        var image = filteredPokemonInfo[indexPath.row].getImageFromURL()
        print(image)
        cell.pokeImageView.image = image
        cell.name.text = filteredPokemonInfo[indexPath.row].name
        return cell
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let pokeCell = cell as! PokemonTableViewCell
//        pokeCell.pokeImageView.image = filteredPokemon[indexPath.row]
//        pokeCell.name.text = filteredPokemonInfo[indexPath.row].name
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSelected = indexPath.row
        print(indexSelected)
        self.performSegue(withIdentifier: "toProfile", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
