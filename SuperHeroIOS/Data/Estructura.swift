//
//  Estructura.swift
//  SuperHeroIOS
//
//  Created by Mañanas on 11/4/24.
//

import Foundation


struct SuperHeroResponse {
    let response: String
    let results: Array<SuperHero>
    let resultsFor: String
}



struct SuperHero {
    let id:String
    let name:String
    let biography: Biography
    let image:Image
}

struct Biography {
    let alignment: String
    let alterEgos: String
    let firstAppearance: String
    let fullName: String
    let placeOfBirth: String
    let publisher: String
}

struct Image {
    let url: String
}
