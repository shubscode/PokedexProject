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
    
//    var filteredPokemon = [#imageLiteral(resourceName: "placeholderpoke"),#imageLiteral(resourceName: "placeholderpoke"),#imageLiteral(resourceName: "placeholderpoke"),#imageLiteral(resourceName: "placeholderpoke"),#imageLiteral(resourceName: "placeholderpoke"),#imageLiteral(resourceName: "placeholderpoke"),#imageLiteral(resourceName: "placeholderpoke"),#imageLiteral(resourceName: "placeholderpoke"),#imageLiteral(resourceName: "placeholderpoke")]
    var filteredPokemonInfo = [Pokemon]()
    var filteredPokemon = [UIImage]()
    
    override func loadView() {
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
        
        filteredPokemonInfo = filterPokemon(name: name, typeFilter: pokeType, minAtk: atk, minDef: def, minHP: hp)
        filteredPokemon = getPokemonImages(pokemon: filteredPokemonInfo)
//        print(filteredPokemon2[0].name)
        
        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 200
        layout.minimumInteritemSpacing = 0
        collectionView = UICollectionView(frame: CGRect(x: 0, y:135, width: view.frame.width, height: view.frame.height-135),
                                          collectionViewLayout: layout)
        collectionView.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: "poke")
        collectionView.backgroundColor = UIColor.white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        view.addSubview(sc)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false;
    }
    
    func changeView(sender: UISegmentedControl) {
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
    
    // set up collectionView
    func makeGrid() {
        tableView.removeFromSuperview()
        
        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 0
        collectionView = UICollectionView(frame: CGRect(x: 0, y:135, width: view.frame.width, height: view.frame.height-135),
                                          collectionViewLayout: layout)
        collectionView.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: "poke")
        collectionView.backgroundColor = UIColor.white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
    }
    
    // renders tableView
    func makeList() {
        collectionView.removeFromSuperview()
        
        tableView = UITableView(frame: CGRect(x: 0, y:135, width: view.frame.width, height: view.frame.height-135),
                                style: UITableViewStyle.plain)
        tableView.backgroundColor = UIColor.green
        
        view.addSubview(tableView)
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

extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    // specifying number of sections in the CV
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return filteredPokemon.count/2
    }
    
    // specifying number of cells in the given section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    // use this method to dequeue the cell and set it up
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "poke", for: indexPath)
            as!PokemonCollectionViewCell
        cell.awakeFromNib()
        cell.delegate = self
        return cell
    }
    
    // use this method to populate the data of a given cell
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let pokeCell = cell as! PokemonCollectionViewCell
        pokeCell.pokeImageView.image = filteredPokemon[indexPath.row]
    }
    
    // sets the size of the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 160, height:160)
        
//        let padding: CGFloat =  50
//        let collectionViewSize = collectionView.frame.size.width - padding
//
//        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
        
    }
    
//    // if we want something to happen when user taps a cell, use this method
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
    
}

extension ListViewController: PokemonCollectionViewCellDelegate {
    func toProfile(forCell: PokemonCollectionViewCell) {
        self.performSegue(withIdentifier: "toProfile", sender: Any)
    }
}
