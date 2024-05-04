//
//  NetworkHeros.swift
//  SuperPoderesRocio
//
//  Created by Rocio Martos on 26/4/24.
//

import Foundation
import KeychainSwift

class NetworkHeros {
    // Define la función getHeros como asíncrona
    func getHeros(filter: String, completion: @escaping ([SuperHero]?, Error?) -> Void) {
        // Crea la URL usando el rawValue de Endpoints.heros
        guard let url = URL(string: Endpoints.heros.rawValue) else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        // Crea la solicitud URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.get
        
        // Crea una sesión URLSession para realizar la solicitud
        let session = URLSession.shared
        
        // Realiza la solicitud de manera asíncrona
        let task = session.dataTask(with: request) { (data, response, error) in
            // Comprueba si hubo un error
            if let error = error {
                completion(nil, error)
                return
            }
            
            // Comprueba si se recibieron datos
            guard let data = data else {
                completion(nil, NSError(domain: "No data received", code: 0, userInfo: nil))
                return
            }
            
            // Decodifica los datos JSON en un array de objetos SuperHero
            do {
                let decodedData = try JSONDecoder().decode([SuperHero].self, from: data)
                completion(decodedData, nil)
            } catch {
                completion(nil, error)
            }
        }
        
        // Inicia la tarea de URLSession
        task.resume()
    }
}
