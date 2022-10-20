//
//  Network.swift
//  SHORTLY
//
//  Created by halil ibrahim Elkan on 20.07.2022.
//

import Foundation

struct Network {
    
    private let baseUrlString = "https://api.shrtco.de/v2/"
    
    func request<T: Decodable>(endpointType: EndpointType, comletion: @escaping (Result<T, CustomError>) -> Void) {
        
        let session = URLSession.shared
        
        guard let url = URL(string: baseUrlString + endpointType.endpoint) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpointType.method.rawValue
        
        session.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                comletion(.failure(CustomError(message: "Gelen response içinde data yok")))
                return
            }
            
            print(data)
            
            let decoder = JSONDecoder()
            
            do {
                let decodedResponse = try decoder.decode(T.self, from: data)
                comletion(.success(decodedResponse))
            }
            catch let error {
                comletion(.failure(CustomError(message: error.localizedDescription)))
            }
            
        } .resume()
        
    }
    
}
