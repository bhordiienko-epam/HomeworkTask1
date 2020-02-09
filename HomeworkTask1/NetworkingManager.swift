//
//  NetworkingManager.swift
//  HomeworkTask1
//
//  Created by Bohdan on 07.12.2019.
//  Copyright © 2019 HorBog. All rights reserved.
//

import Foundation

class NetworkingManager: NetworkingManagerProtocol {
    public static let shared = NetworkingManager()
    
    func loadList(url: URL?, completionHandler: @escaping (ListModel?, Error?) -> Void) {
        guard let url = url else { return }
        load(url: url) { data, error in
            if let error = error {
                completionHandler(nil, error)
                return
            }
            guard let data = data else { return }
            let testresponse = ListModel(from: data)
            
            DispatchQueue.main.async {
                completionHandler(testresponse, nil)
            }
        }
    }
    
    func load(url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        let dataTask =
            URLSession.shared.dataTask(with: url) { data, response, error in
            completionHandler(data, error)
        }
        
        dataTask.resume()
    }
}

