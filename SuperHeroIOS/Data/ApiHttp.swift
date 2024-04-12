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
    
    
    func searchByName(query: String) async throws-> Array<SuperHero>{
        baseUrl=baseUrl + "search/\(query)"
        response=try await performAPICall()
        return (response!.results)
    }
    
    func searchByName(sid: String) async throws-> Array<SuperHero>{
        baseUrl=baseUrl + "\(sid)"
        response=try await performAPICall()
        return (response!.results)
    }
    
    private func performAPICall() async throws -> SuperHeroResponse {
        //Establecer URL
        let url = URL(string: baseUrl)!
        print ("Llamada a api")
        let (data,_) = try await URLSession.shared.data(from: url)
        print ("Datos recibidos: \(data.count)")
        print ("Procesado con Decoder")
        let decoder=JSONDecoder()
        do {
            response = try decoder.decode(SuperHeroResponse.self, from: data)
        } catch {
            print(error)
        }
        print ("Decoder Terminado")
        print ("Llamada correcta?: \(response!.response)")
        //print ("Prueba de datos?: \(response!.results[0].name)")
        
        return (response!)
    }
    
    
        
    
}
