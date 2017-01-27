//
//  PokedexVC.swift
//  Pokedex
//
//  Created by Chris Chow on 23/1/2017.
//  Copyright © 2017 Yau On Chow. All rights reserved.
//

import UIKit

class PokedexVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var pokeSearchBar: UISearchBar!
    
    var pokemons = [Pokemon]()
    var filteredPokemons = [Pokemon]()
    var inSearchMode = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.dataSource = self
        collection.delegate = self
        
        pokeSearchBar.delegate = self
        pokeSearchBar.returnKeyType = UIReturnKeyType.done
        
        parsePokemonCSV()
    }

    
    func parsePokemonCSV() {
        
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do {
            
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                
                let pokemonId = Int(row["id"]!)!
                let name = row["identifier"]!
                
                let pokemon = Pokemon(pokemonId: pokemonId, name: name)
                
                pokemons.append(pokemon)
            }
            
        } catch let err as NSError {
            
            print(err.debugDescription)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokedexCellID", for: indexPath) as? PokedexCell {
            
            if inSearchMode {
                
                cell.configureCell(pokemon: filteredPokemons[indexPath.row])
                
            } else {
                
                cell.configureCell(pokemon: pokemons[indexPath.row])
            }
            
            return cell
            
        } else {
            
            return UICollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var pokemon: Pokemon!
        
        if inSearchMode {
            
            pokemon = filteredPokemons[indexPath.row]
            
        } else {
            
            pokemon = pokemons[indexPath.row]
        }
        
        performSegue(withIdentifier: "PokemonDetailVC", sender: pokemon)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if inSearchMode {
            
            return filteredPokemons.count
            
        } else {
            
            return pokemons.count
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 105, height: 105)
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if pokeSearchBar.text == nil || pokeSearchBar.text == "" {
            
            inSearchMode = false
            view.endEditing(true)
            
        } else {
            
            inSearchMode = true
            
            let lowerSearchText = pokeSearchBar.text!.lowercased()
            filteredPokemons = pokemons.filter({$0.name.range(of: lowerSearchText) != nil})
            
        }
        
        collection.reloadData()
    }

    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        view.endEditing(true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "PokemonDetailVC" {
            
            if let detailVC = segue.destination as? PokemonDetailVC {
                
                if let pokemon = sender as? Pokemon {
                    
                    detailVC.pokemon = pokemon
                }
            }
        }
    }
    
}

