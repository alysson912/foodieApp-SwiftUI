//
//  NetworkManager.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 25/08/25.
//

import Foundation
import UIKit
/*
 //MARK: Declarando "Final" a classe:
- Você está dizendo ao compilador que essa classe não pode ser herdada.
 
 - Vantagens:
 * Desempenho melhorado
 * Mais segurança no código
 * Clareza de intenção
 
- Quando não usar final?
 * Se você pretende permitir que outras classes herdem dessa classe.
 * Se estiver criando uma classe base (superclasse) para ser reutilizada por herança.
 */

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://mocki.io/v1/"
    private let appetizerURL = baseURL + "9f7f7b65-93aa-45ce-ad6d-fe5207529454"
    
    private init() {}
    
    func getAppetizers(completed: @escaping (Result<[AppetizerModel], APError>) -> Void) {
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidResponse))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }        
            
        }
        task.resume()
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
    
}
