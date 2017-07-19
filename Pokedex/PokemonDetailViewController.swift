//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Pragun Sharma on 18/07/17.
//  Copyright © 2017 Pragun Sharma. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    var pokemon: Pokemon!

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexIdLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var nextEvoImage: UIImageView!
    @IBOutlet weak var currEvoImage: UIImageView!
    @IBOutlet weak var baseAttackLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var evoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = pokemon.name.capitalized
        let img = UIImage(named: "\(pokemon.pokedexID)")
        currEvoImage.image = img
        mainImg.image = img
        pokedexIdLabel.text = "\(pokemon.pokedexID)"
        
        pokemon.downloadPokemonDetails {
            
            //Whatever we run here will only be called after the network call is complete!
            self.updateUI()
        }
        
    }

    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func updateUI() {

        baseAttackLabel.text = pokemon.attack
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        typeLabel.text = pokemon.type
        descriptionLabel.text = pokemon.description
        
        if pokemon.nextEvolutionID == "" {
            evoLabel.text = "No Evolutions"
            nextEvoImage.isHidden = true
        } else {
            nextEvoImage.isHidden = false
            nextEvoImage.image = UIImage(named: "\(pokemon.nextEvolutionID)")
            let str = "Next Evolution: \(pokemon.nextEvolutionName) - Level \(pokemon.nextEvolutionLevel)"
            evoLabel.text = str
        }
        
        
    }

}
