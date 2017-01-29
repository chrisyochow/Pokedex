//
//  Pokemon.swift
//  Pokedex
//
//  Created by Chris Chow on 23/1/2017.
//  Copyright © 2017 Yau On Chow. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _pokemonId: Int!
    private var _name: String!
    private var _description: String = ""
    private var _type: String = ""
    private var _attack:String = ""
    private var _defense: String = ""
    private var _height: String = ""
    private var _weight: String = ""
    private var _nextEvolution: String = ""
    private var _pokemonURL: String = ""
    
    var pokemonId: Int {
        
        return _pokemonId
    }
    
    var name: String {
        
        return _name
    }
    
    var description: String {
        
        return _description
    }
    
    var type: String {
        
        return _type
    }
    
    var attack: String {
        
        return _attack
    }
    
    var defense: String {
        
        return _defense
    }
    
    var height: String {
        
        return _height
    }
    
    var weight: String {
        
        return _weight
    }
    
    var nextEvolution: String {
        
        return _nextEvolution
    }
    
    init(pokemonId: Int, name: String) {
        
        self._pokemonId = pokemonId
        self._name = name
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(_pokemonId!)/"
        
    }
    
    
    func downloadPokemonDetail(completed: DownloadComplete) {
        
        //Alamofire.request("http://pokeapi.co/api/v1/pokemon/149/").responseJSON { response in
        Alamofire.request(_pokemonURL).responseJSON { response in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                
                if let attack = dict["weight"] as? Int {
                    
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    
                    self._defense = "\(defense)"
                }
                
                if let height = dict["height"] as? String {
                    
                    self._height = height
                }
                
                if let weight = dict["weight"] as? String {
                    
                    self._weight = weight
                }
            }
            
            //For debugging
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
        
        completed()
    }
}
