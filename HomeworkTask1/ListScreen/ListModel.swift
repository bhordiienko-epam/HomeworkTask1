//
//  ListModel.swift
//  HomeworkTask1
//
//  Created by Bohdan on 06.12.2019.
//  Copyright © 2019 HorBog. All rights reserved.
//

import Foundation


struct ListModel: Codable {
    var strings: [String]
    
    init(from data: Data?) {
        guard let data = data else {
            strings = [String]()
            return
        }
        let str = String(decoding: data, as: UTF8.self)
        strings = str.toArray()
    }
    
    subscript(index: Int) -> String {
        return strings[index]
    }
}

fileprivate extension String {
    func toArray() -> [String] {
        var array = self.components(separatedBy: "\n")
        array = array.filter {!$0.isEmpty}
        
        return array
    }
}
