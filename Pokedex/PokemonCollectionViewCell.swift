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
        pokeImageView = UIImageView(frame: CGRect(x:20, y:15, width: 120, height:120))
//        pokeImageView.contentMode = .scaleAspectFill
        pokeImageView.layer.cornerRadius = 10
        pokeImageView.clipsToBounds = true
        pokeImageView.layer.borderColor = UIColor.black.cgColor
        contentView.addSubview(pokeImageView) //remember to add UI elements to the contentView not the cell itself
        
        button = UIButton(frame: CGRect(x:20, y:15, width: 120, height:120))
        pokeImageView.layer.cornerRadius = 10
        pokeImageView.clipsToBounds = true
        button.addTarget(self, action: #selector(toProfile), for: .touchUpInside)
        contentView.addSubview(button)
    }
    
    func toProfile() {
        delegate?.toProfile(forCell: self)

    }
}
