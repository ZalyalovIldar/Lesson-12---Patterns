//
//  PlacesServiceImpl.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation
import GooglePlaces

class PlacesServiceImpl: PlacesService {
    
    /// decoder that also performs snake case convertion
    lazy var decoder: JSONDecoder = {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return decoder
    }()
    
    var session: URLSession!
    
    func getPlacesBy(city: String, completion: @escaping (Result<ApiResponse, Error>) -> Void) {
        
        guard let url = URL(string: Endpoints.pointOfInterstUrl(city: city)) else { return }
                        
        session.dataTask(with: url) { [weak self] data, _, error in
            
            guard let self = self else { return }
            
            if let error = error {
                
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                
                return
            }
            
            if let dataUnwrapped = data, let decoded = try? self.decoder.decode(ApiResponse.self, from: dataUnwrapped) {
                        
                DispatchQueue.main.async {
                    completion(.success(decoded))
                }
            }
        }.resume()
    }    
}
