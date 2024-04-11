//
//  ApiHttp.swift
//  SuperHeroIOS
//
//  Created by Mañanas on 11/4/24.
//

import Foundation

class ApiHttp {
    
    var baseUrl = "https://www.superheroapi.com/api.php/7252591128153666/"
    var response:SuperHeroResponse?=nil
    
    
    func searchByName(query: String) async -> Array<SuperHero>{
        baseUrl=baseUrl + "search/\(query)"
        response=try! await performAPICall()
        return (response!.results)
    }
    
    func searchByName(sid: String) async -> Array<SuperHero>{
        baseUrl=baseUrl + "\(sid)"
        response=try! await performAPICall()
        return (response!.results)
    }
    
    private func performAPICall() async throws -> SuperHeroResponse {
        //Establecer URL
        let url = URL(string: baseUrl)!
        //print ("Llamada a api")
        let (data,_) = try await URLSession.shared.data(from: url)
        
        //print ("Procesado con Decoder")
        let decoder=JSONDecoder()
        response = try decoder.decode(type(of: response).self, from: data)
        
        //print ("Llamada correcta?: \(apiData.success)")
        //print ("Prueba de datos?: \(response!.results[0].name)")
        
        return (response!)
    }
    
    
        
    
}
