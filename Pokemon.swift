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
    private var _description: String!
    private var _type: String!
    private var _attack: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _nextEvolution: String!
    private var _pokemonURL: String!
    
    var pokemonId: Int {
        
        return _pokemonId
    }
    
    var name: String {
        
        return _name
    }
    
    init(pokemonId: Int, name: String) {
        
        self._pokemonId = pokemonId
        self._name = name
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(_pokemonId)/"
    }
    
    
}
