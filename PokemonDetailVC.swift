//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Chris Chow on 25/1/2017.
//  Copyright © 2017 Yau On Chow. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var viewTitleLbl: UILabel!
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewTitleLbl.text = pokemon.name.capitalized
    }

}

