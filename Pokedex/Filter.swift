//
//  Filter.swift
//  Pokedex
//
//  Created by Shubham Gupta on 2/14/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import Foundation
import UIKit

var filterName: String!
var filterPokeType = Set<String>()
var filterAtk: Int!
var filterDef: Int!
var filterHP: Int!


func getPokemonImages(pokemon: [Pokemon]) -> [UIImage] {
    var images = [UIImage]()
    for poke in pokemon {
        images.append(getImageFromURL(imageUrl: poke.imageUrl))
    }
    return images
}

func filterPokemon(name: String?, typeFilter: Set<String>, minAtk: Int?, minDef: Int?, minHP: Int?) -> [Pokemon] {
    var filtered = pokemonList
    //nullChecks(name: name, typeFilter: typeFilter, minAtk: minAtk, minDef: minDef, minHP: minHP)
    if let filterName = name {
        print("Name is not null!")
        for pokemon in filtered {
            if pokemon.name != filterName {
                let index = filtered.index(where: { (poke) -> Bool in
                    poke.name == pokemon.name
                })
                filtered.remove(at: index!)
            }
        }
    }
    if !typeFilter.isEmpty {
        for pokemon in filtered {
            if setNotContainsTypes(typeFilter: typeFilter, currentTypes: pokemon.types) {
                let index = filtered.index(where: { (poke) -> Bool in
                    poke.name == pokemon.name
                })
                filtered.remove(at: index!)
            }
        }
    }
    if let filterAtk = minAtk {
        for pokemon in filtered {
            if pokemon.attack < filterAtk {
                let index = filtered.index(where: { (poke) -> Bool in
                    poke.name == pokemon.name
                })
                filtered.remove(at: index!)
            }
        }
    }
    if let filterDef = minDef {
        for pokemon in filtered {
            if pokemon.defense < filterDef {
                let index = filtered.index(where: { (poke) -> Bool in
                    poke.name == pokemon.name
                })
                filtered.remove(at: index!)
            }
        }
    }
    if let filterHP = minHP {
        for pokemon in filtered {
            if pokemon.health < filterHP {
                let index = filtered.index(where: { (poke) -> Bool in
                    poke.name == pokemon.name
                })
                filtered.remove(at: index!)
            }
        }
    }
    return filtered
}

func nullChecks(name: String?, typeFilter: Set<String>, minAtk: Int?, minDef: Int?, minHP: Int?) {
    if name != nil {
        filterName = name
    }
    if minAtk != nil {
        filterAtk = minAtk
    }
    if minDef != nil {
        filterDef = minDef
    }
    if minHP != nil {
        filterHP = minHP
    }
}

func setNotContainsTypes (typeFilter: Set<String>, currentTypes: [String]) -> Bool {
    for i in currentTypes {
        if !(typeFilter.contains(i)) {
            return true
        }
    }
    return false
}

func random20() -> [Pokemon] {
    let pokemons = Array(pokemonList[0...20])
    return pokemons
}
