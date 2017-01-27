//
//  PokedexCell.swift
//  Pokedex
//
//  Created by Chris Chow on 23/1/2017.
//  Copyright © 2017 Yau On Chow. All rights reserved.
//

import UIKit

class PokedexCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var pokemonIdLbl: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(pokemon: Pokemon) {
        
        self.pokemon = pokemon
        
        pokemonIdLbl.text = "\(self.pokemon.pokemonId)"
        nameLbl.text = self.pokemon.name.capitalized
        pokemonImg.image = UIImage(named: "\(self.pokemon.pokemonId)")
    }
    
}
