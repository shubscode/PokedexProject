//
//  PokemonInfoViewController.swift
//  Pokedex
//
//  Created by Shubham Gupta on 2/13/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

class PokemonInfoViewController: UIViewController {
    
    var pokemonImage: UIImage!
    var imageView: UIImageView!
    var rectangleView: UIImageView!
    
    var nameLabel: UILabel!
    var numberLabel: UILabel!
    var attackLabel: UILabel!
    var defenseLabel: UILabel!
    var healthLabel: UILabel!
    var specialAttackLabel: UILabel!
    var specialDefenseLabel: UILabel!
    var speciesLabel: UILabel!
    var speedLabel: UILabel!
    var totalLabel: UILabel!
    
    var name: String!
    var number: Int!
    var attack: Int!
    var defense: Int!
    var health: Int!
   
    var specialAttack: Int!
    var specialDefense: Int!
    var species: String!
    var speed: Int!
    var total: Int!
    
    var types: [String] = []
    var imageUrl: String!
    
    var favoriteButton: UIButton!
    var webSearchButton: UIButton!
    
    var customPurple = UIColor(red: 0.6863, green: 0.2902, blue: 0.698, alpha: 1.0)
    var customPurple2 =  UIColor(red: 0.5176, green: 0.4392, blue: 0.9569, alpha: 1.0)
    
    //let tabBarController = UITabBarController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(frame: CGRect(x: 20, y: 80, width: view.bounds.width - 40, height: 240))
        imageView.image = UIImage(named: "placeholderpoke.jpg")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        view.addSubview(imageView)
        
        rectangleView = UIImageView(frame: CGRect(x: 20, y: 330, width: view.bounds.width - 40, height: 210))
        rectangleView.image = UIImage(named: "purpleRect")
        rectangleView.contentMode = .scaleAspectFill
        rectangleView.clipsToBounds = true
        rectangleView.layer.cornerRadius = 10
        rectangleView.layer.borderColor = UIColor.black.cgColor
        view.addSubview(rectangleView)

        
        attributeSetup()
        buttonSetup()
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
    
    func buttonSetup() {
        favoriteButton = UIButton(frame: CGRect(x: 20, y: 560, width: view.frame.width - 40, height: 40))
        favoriteButton.backgroundColor = customPurple2
        favoriteButton.layer.cornerRadius = 15
        favoriteButton.setTitle("Add To Favorites!", for: .normal)
        view.addSubview(favoriteButton)
        favoriteButton.addTarget(self, action: #selector(addToFavorites), for: .touchUpInside)
        
        webSearchButton = UIButton(frame: CGRect(x: 20, y: 620, width: view.frame.width - 40, height: 40))
        webSearchButton.backgroundColor = customPurple2
        webSearchButton.layer.cornerRadius = 15
        webSearchButton.setTitle("Search the Web!", for: .normal)
        view.addSubview(webSearchButton)
        //search.addTarget(self, action: #selector(toSearch), for: .touchUpInside)
        
        
    }
    func attributeSetup() {
        
        nameLabel = UILabel(frame: CGRect(x: 30, y: 340, width: view.frame.midX - 20, height: 30))
        nameLabel.text = "Name: \(name)"
        view.addSubview(nameLabel)
        
        numberLabel = UILabel(frame: CGRect(x: 30, y: 380, width: view.frame.midX - 20, height: 30))
        numberLabel.text = "Number: \(number)"
        view.addSubview(numberLabel)
        
        attackLabel = UILabel(frame: CGRect(x: 30, y: 420, width: view.frame.midX - 20, height: 30))
        attackLabel.text = "Attack: \(attack)"
        view.addSubview(attackLabel)
        
        defenseLabel = UILabel(frame: CGRect(x: 30, y: 460, width: view.frame.midX - 20, height: 30))
        defenseLabel.text = "Defense: \(defense)"
        view.addSubview(defenseLabel)
        
        healthLabel = UILabel(frame: CGRect(x: 30, y: 500, width: view.frame.midX - 20, height: 30))
        healthLabel.text = "HP: \(health)"
        view.addSubview(healthLabel)
        
        specialAttackLabel = UILabel(frame: CGRect(x: view.frame.midX, y: 340, width: view.frame.midX - 20, height: 30))
        specialAttackLabel.text = "Special Attack: \(specialAttack)"
        view.addSubview(specialAttackLabel)
        
        specialDefenseLabel = UILabel(frame: CGRect(x: view.frame.midX, y: 380, width: view.frame.midX - 20, height: 30))
        specialDefenseLabel.text = "Special Defense: \(specialDefense)"
        view.addSubview(specialDefenseLabel)
        
        speciesLabel = UILabel(frame: CGRect(x: view.frame.midX, y: 420, width: view.frame.midX - 20, height: 30))
        speciesLabel.text = "Species: \(species)"
        view.addSubview(speciesLabel)
        
        speedLabel = UILabel(frame: CGRect(x: view.frame.midX, y: 460, width: view.frame.midX - 20, height: 30))
        speedLabel.text = "Speed: \(speed)"
        view.addSubview(speedLabel)
        
        totalLabel = UILabel(frame: CGRect(x: view.frame.midX, y: 500, width: view.frame.midX - 20, height: 30))
        totalLabel.text = "Total: \(total)"
        view.addSubview(totalLabel)
    }
    
    @objc func addToFavorites() {
        
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
