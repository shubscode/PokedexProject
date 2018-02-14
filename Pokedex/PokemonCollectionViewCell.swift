//
//  PokemonCollectionViewCell.swift
//  Pokedex
//
//  Created by Fang on 2/14/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    var pokeImageView: UIImageView!
    
    override func awakeFromNib() {
        pokeImageView = UIImageView(frame: contentView.frame)
        pokeImageView.contentMode = .scaleAspectFill
        pokeImageView.layer.cornerRadius = 10
        pokeImageView.clipsToBounds = true
        contentView.addSubview(pokeImageView) //remember to add UI elements to the contentView not the cell itself 
    }
}
