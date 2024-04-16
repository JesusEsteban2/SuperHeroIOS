//
//  SecondViewController.swift
//  SuperHeroIOS
//
//  Created by Mañanas on 12/4/24.
//

import UIKit

class SecondViewController: UIViewController {
    var superParam:SuperHero?=nil
    var filaParam:Int=0
    
    @IBOutlet weak var imageSuper: UIImageView!
    @IBOutlet weak var nomSuper: UILabel!
    @IBOutlet weak var combat: UITextField!
    @IBOutlet weak var durab: UITextField!
    @IBOutlet weak var intelig: UITextField!
    @IBOutlet weak var power: UITextField!
    @IBOutlet weak var speed: UITextField!
    @IBOutlet weak var strength: UITextField!
    @IBOutlet weak var eyecol: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var haircolor: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var race: UITextField!
    @IBOutlet weak var weight: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageSuper.loadImage(fromURL: superParam!.image.url)
        nomSuper.text=superParam?.name
        combat.text=superParam?.powerstats.combat
        durab.text=superParam?.powerstats.durability
        intelig.text=superParam?.powerstats.intelligence
        power.text=superParam?.powerstats.power
        speed.text=superParam?.powerstats.speed
        strength.text=superParam?.powerstats.strength
        eyecol.text=superParam?.appearance.eyeColor
        gender.text=superParam?.appearance.gender
        haircolor.text=superParam?.appearance.hairColor
        height.text=superParam?.appearance.height[1]
        race.text=superParam?.appearance.race
        weight.text=superParam?.appearance.weight[1]
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
