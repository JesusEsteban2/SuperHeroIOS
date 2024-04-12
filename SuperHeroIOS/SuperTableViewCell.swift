//
//  SuperTableViewCell.swift
//  SuperHeroIOS
//
//  Created by Mañanas on 11/4/24.
//

import UIKit
import Foundation

class SuperTableViewCell: UITableViewCell {

    @IBOutlet weak var superImagen: UIImageView!
    @IBOutlet weak var nombre: UILabel!
    
    func render (ima:String,tit:String){
        superImagen.loadImage(fromURL: ima)
        //superImagen.load(url: URL(string:ima)!)
        nombre.text=tit
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

