//
//  WebService.swift
//  HaberProject
//
//  Created by İbrahim Gülmez on 21.08.2023.
//

import Foundation
class WebService {
    func haberleriIndir(url: URL , completion: @escaping ([News]?) -> ()) {
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
              let haberDizisi = try? JSONDecoder().decode([News].self, from: data)
                if haberDizisi != nil {
                    completion(haberDizisi)
                }
            }
            
        }.resume()
    }
}




