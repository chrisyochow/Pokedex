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

        viewTitleLbl.text = self.pokemon.name.capitalized
        
        updateUI()
        
    }

    
    func updateUI() {
        
        pokeNameLbl.text = self.pokemon.name.capitalized
        pokeImage.image = UIImage(named: "\(self.pokemon.pokemonId)")
        
    }
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
}

