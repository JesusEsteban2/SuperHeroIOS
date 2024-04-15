//
//  ApiHttp.swift
//  SuperHeroIOS
//
//  Created by Mañanas on 11/4/24.
//

import Foundation

class ApiHttp {
    let baseUrl = "https://www.superheroapi.com/api.php/7252591128153666/"
    var response:SuperHeroResponse?=nil
    
    func searchByName(query: String) async throws-> Array<SuperHero>{
        //Si no se ha pasado parámetro devolver.
        if query.isEmpty{
            print ("Valor vacio en busqueda")
            return (response!.results)
        }
        
        //Componer URL para pasar a la llamada
        let url = baseUrl + "search/\(query)"
        //Capturar la respuesta de la llamada en response.
        response=try await performAPICall(urlString: url)
        //Devolver la lista de superheroes
        return (response!.results)
    }
    
    func searchById(sid: String) async throws-> Array<SuperHero>{
        //Si no se ha pasado parámetro devolver.
        if sid.isEmpty{
            print ("Valor vacio en busqueda")
            return (response!.results)
        }
        
        //Componer URL para pasar a la llamada
        let url=baseUrl + "\(sid)"
        //Capturar la respuesta de la llamada en response.
        response=try await performAPICall(urlString: url)
        //Devolver la lista de superheroes
        return (response!.results)
    }
    
    private func performAPICall(urlString:String) async throws -> SuperHeroResponse {
        
        //Establecer URL
        let url = URL(string: urlString)!
        // print ("Llamada a api")
        let (data,_) = try await URLSession.shared.data(from: url)
        print ("Datos recibidos: \(data.count)")
        //print ("Procesado con Decoder")
        let decoder=JSONDecoder()
        // No funciona con los guiones medios
        // decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            response = try decoder.decode(type(of: response), from: data)
        }
        print ("Decoder Terminado")
        //print ("Llamada correcta?: \(response!.response)")
        //print ("Prueba de datos?: \(response!.results[0].name)")
        
        return (response!)
    }
    
    
        
    
}
