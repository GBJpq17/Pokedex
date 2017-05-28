//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by RyLo on 5/22/17.
//  Copyright © 2017 GBJpq. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var currentEvolImage: UIImageView!
    @IBOutlet weak var nextEvolImage: UIImageView!
    @IBOutlet weak var evoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = pokemon.name.capitalized
        let img = UIImage(named: "\(pokemon.pokedexID)")
        mainImage.image = img
        currentEvolImage.image = img
        pokedexLabel.text = "\(pokemon.pokedexID)"
        
        pokemon.downloadPokemonDetails {
            
            self.updateUI()
            
        }
    }
    
    func updateUI() {
        
        attackLabel.text = pokemon.attack
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        typeLabel.text = pokemon.type
        descriptionLabel.text = pokemon.description
        
        if pokemon.nextEvolutionID == "" {
            evoLabel.text = "No Evolutions"
            nextEvolImage.isHidden = true
        } else {
            nextEvolImage.isHidden = false
            nextEvolImage.image = UIImage(named: pokemon.nextEvolutionID)
            
            let str = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            evoLabel.text = str
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
