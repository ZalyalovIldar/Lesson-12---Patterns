//
//  PlaceManager.swift
//  PatternsLesson
//
//  Created by Amir on 22.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import GooglePlaces

protocol PlaceManagerProtocol {
    func getPlacesIn(city: String, completion: @escaping (Result<Response, Error>) -> Void)
}

class PlaceManager: PlaceManagerProtocol {
    
    /// Google api url to get image of place
    /// - Parameter reference: photo reference
    static func getImageUrl(photoReference: String) -> String {
        return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=200&photoreference=\(photoReference)&key=\(Constants.googleApiKey)"
    }
    
    func getPlacesIn(city: String, completion: @escaping (Result<Response, Error>) -> Void) {
                       
        guard let apiURL = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(city)+point+of+interest&sensor=false&key=\(Constants.googleApiKey)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: apiURL) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let data = data, let response = try? decoder.decode(Response.self, from: data) else { return }
                        
            DispatchQueue.main.async {
                completion(.success(response))
            }
            
        }.resume()
    }
}
