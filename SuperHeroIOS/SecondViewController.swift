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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageSuper.loadImage(fromURL: superParam!.image.url)
        nomSuper.text=superParam?.name
        
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
