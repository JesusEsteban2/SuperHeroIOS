//
//  Estructura.swift
//  SuperHeroIOS
//
//  Created by Mañanas on 11/4/24.
//

import Foundation


struct SuperHeroResponse:Codable{
    let response: String
    let results: Array<SuperHero>
    //let resultsFor: String
}



struct SuperHero:Codable{
    let id:String
    let name:String
    // let biography: Biography
    let image:ImageCu
}

struct Biography:Codable{
    let alignment: String
    let alterEgos: String
    //let firstAppearance: String
    //let fullName: String
    //let placeOfBirth: String
    //let publisher: String
}

struct ImageCu:Codable{
    let url: String
}
