//
//  Pokemon.swift
//  Pokedex
//
//  Created by SAMEER SURESH on 9/25/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import Foundation
import UIKit

var types = ["Bug", "Grass", "Dark", "Ground", "Dragon", "Ice", "Electric", "Normal", "Fairy",
             "Poison", "Fighting", "Psychic", "Fire", "Rock", "Flying", "Steel", "Ghost", "Water"]
var pokemonList = PokemonGenerator.getPokemonArray()

var favoritePokemon = [Pokemon]()



func tagToType(tagNumber:Int) -> String {
    return types[tagNumber]
}

func getImageFromURL(imageUrl: String) -> UIImage {
    var imageToDisplay = UIImage(named: "Pokedex")
    let url = URL(string: imageUrl)!
    let session = URLSession(configuration: .default)
    let downloadPicTask = session.dataTask(with: url) { (data, response, error) in
        if let e = error {
            print("Error downloading picture: \(e)")
        } else {
            print("I'm downloading")
            if let _ = response as? HTTPURLResponse {
                if let imageData = data {
                    DispatchQueue.main.async {
                        print("I'm changing the image to: ")
                        let pokemonImage = UIImage(data: imageData)
//                        print(pokemonImage!)
                        imageToDisplay = pokemonImage
                    }
                } else {
                    print("Couldn't get image: Image is nil")
                }
            } else {
                print("Couldn't get response code")
            }
        }
    }
    print("I get here1")
    downloadPicTask.resume()
    print("I get here2")
    print(imageToDisplay)
//    print(imageToDisplay!)
    return imageToDisplay!
}


class Pokemon {
    
    /* Note 1: 
       There are 18 different types of Pokemon, and a single Pokemon can inherit multiple types:
            Bug, Grass, Dark, Ground, Dragon, Ice, Electric, Normal, Fairy,
            Poison, Fighting, Psychic, Fire, Rock, Flying, Steel, Ghost, Water
    */
    
    /* Note 2:
       The image for each Pokemon is not provided, but a URL is. You should look up how to get an image from it's URL.
    */
    
    /* Note 3:
       You can access the properties of Pokemon using dot notation (e.g. pokemon.name, pokemon.number, etc.)
     */
 
    let name: String!
    let number: Int!
    let attack: Int!
    let defense: Int!
    let health: Int!
    let specialAttack: Int!
    let specialDefense: Int!
    let species: String!
    let speed: Int!
    let total: Int!
    let types: [String]
    let imageUrl: String!
    
    
    init(name: String, number: Int, attack: Int, defense: Int, health: Int, spAttack: Int, spDef: Int, species: String, speed: Int, total: Int, types: [String]) {
        self.name = name
        self.number = number
        self.attack = attack
        self.defense = defense
        self.health = health
        self.specialAttack = spAttack
        self.specialDefense = spDef
        self.species = species
        self.speed = speed
        self.total = total
        self.types = types
        self.imageUrl = "http://img.pokemondb.net/artwork/\(name.components(separatedBy: " ")[0].lowercased()).jpg"
    }
    
}
