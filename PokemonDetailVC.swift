//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Chris Chow on 25/1/2017.
//  Copyright © 2017 Yau On Chow. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var bioAndMoveSelect: UISegmentedControl!
    @IBOutlet weak var viewTitleLbl: UILabel!
    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet weak var pokeNameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var pokedexIdLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var evo1Image: UIImageView!
    @IBOutlet weak var evo1ToEvo2ArrowLbl: UILabel!
    @IBOutlet weak var evo2Image: UIImageView!
    @IBOutlet weak var evo2ToEvo3ArrowLbl: UILabel!
    @IBOutlet weak var evo3Image: UIImageView!
    
    var pokemon: Pokemon!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewTitleLbl.text = pokemon.name.capitalized
        
        pokemon.downloadPokemonDetail {
            
            self.updateUI()
        }
    }

    
    func updateUI() {
        
        pokeNameLbl.text = pokemon.name.capitalized
        pokeImage.image = UIImage(named: "\(pokemon.pokemonId)")
        descriptionLbl.text = pokemon.description
        pokedexIdLbl.text = "\(pokemon.pokemonId)"
        typeLbl.text = pokemon.type
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        evoLbl.text = pokemon.nextEvolution
    }
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
}

