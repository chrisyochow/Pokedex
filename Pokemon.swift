//
//  Pokemon.swift
//  Pokedex
//
//  Created by Chris Chow on 23/1/2017.
//  Copyright © 2017 Yau On Chow. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _pokemonId: Int!
    private var _name: String!
//    private var _type: String!
//    private var _defense: String!
    
    var pokemonId: Int {
        
        return _pokemonId
    }
    
    var name: String {
        
        return _name
    }
    
    init(pokemonId: Int, name: String) {
        
        self._pokemonId = pokemonId
        self._name = name
    }
}
