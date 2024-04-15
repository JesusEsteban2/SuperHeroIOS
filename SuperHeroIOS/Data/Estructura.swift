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
    let resultsFor: String
    
    enum CodingKeys: String, CodingKey {
        case response,results
        case resultsFor = "results-for"
    }
}



struct SuperHero:Codable{
    let appearance: Appearance
    let biography: Biography
    // let connections: Connections
    let id: String
    let image: Image
    let name: String
    let powerstats: Powerstats
    let work: Work
}

struct Biography:Codable{
    let aliases: [String]
    let alignment: String
    let alterEgos: String
    let firstAppearance: String
    let fullName: String
    let placeOfBirth: String
    let publisher: String
    
    enum CodingKeys:String,CodingKey{
        case aliases,alignment,publisher
        case alterEgos="alter-egos"
        case firstAppearance="first-appearance"
        case fullName="full-name"
        case placeOfBirth="place-of-birth"
    }
}

struct Image:Codable{
    let url: String
}

struct Appearance:Codable{
    let eyeColor: String
    let gender: String
    let hairColor: String
    let height: [String]
    let race: String
    let weight: [String]
    
    enum CodingKeys: String, CodingKey {
        case eyeColor = "eye-color"
        case hairColor = "hair-color"
        case gender,height,race,weight
    }
}

struct Powerstats:Codable{
    let combat: String
    let durability: String
    let intelligence: String
    let power: String
    let speed: String
    let strength: String
}

struct Work:Codable {
    let base: String
    let occupation: String
}

// *************************************
// Estructura de datos de Json
// *************************************
/**
data class prueba(
    val response: String,
    val results: List<Result>,
    val results-for: String
)

data class Result(
    val appearance: Appearance,
    val biography: Biography,
    val connections: Connections,
    val id: String,
    val image: Image,
    val name: String,
    val powerstats: Powerstats,
    val work: Work
)

data class Appearance(
    val eye-color: String,
    val gender: String,
    val hair-color: String,
    val height: List<String>,
    val race: String,
    val weight: List<String>
)

data class Biography(
    val aliases: List<String>,
    val alignment: String,
    val alter-egos: String,
    val first-appearance: String,
    val full-name: String,
    val place-of-birth: String,
    val publisher: String
)

data class Connections(
    val group-affiliation: String,
    val relatives: String
)

data class Image(
    val url: String
)

data class Powerstats(
    val combat: String,
    val durability: String,
    val intelligence: String,
    val power: String,
    val speed: String,
    val strength: String
)

data class Work(
    val base: String,
    val occupation: String
)

**/
