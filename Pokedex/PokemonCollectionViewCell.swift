//
//  PokemonCollectionViewCell.swift
//  Pokedex
//
//  Created by Fang on 2/14/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

protocol PokemonCollectionViewCellDelegate {
    func toProfile(forCell: PokemonCollectionViewCell)
}


class PokemonCollectionViewCell: UICollectionViewCell {
    var pokeImageView: UIImageView!
    var button: UIButton!
    var delegate: PokemonCollectionViewCellDelegate? = nil
    
    override func awakeFromNib() {
        pokeImageView = UIImageView(frame: CGRect(x:15, y:15, width: 320, height:160))
//        pokeImageView.contentMode = .scaleAspectFill
        pokeImageView.layer.cornerRadius = 10
        pokeImageView.clipsToBounds = true
        contentView.addSubview(pokeImageView) //remember to add UI elements to the contentView not the cell itself
        
        button = UIButton(frame: CGRect(x:15, y:15, width: 320, height:160))
        button.backgroundColor = UIColor.green
        pokeImageView.layer.cornerRadius = 10
        pokeImageView.clipsToBounds = true
        contentView.addSubview(pokeImageView) //remember to add UI elements to the contentView not the cell itself
    }
    
    func toProfile() {
        delegate?.toProfile(forCell: self)

    }
}
