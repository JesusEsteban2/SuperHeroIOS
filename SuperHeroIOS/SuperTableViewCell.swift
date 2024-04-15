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
    @IBOutlet weak var power: UIProgressView!
    @IBOutlet weak var speed: UIProgressView!
    @IBOutlet weak var intelig: UIProgressView!
    
    func render (ima:String,tit:String,pow:Int,spee:Int,intel:Int){
        superImagen.loadImage(fromURL: ima)
        //superImagen.load(url: URL(string:ima)!)
        nombre.text=tit
        power.progress=Float(pow)/100
        speed.progress=Float(spee)/100
        intelig.progress=Float(intel)/100
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

