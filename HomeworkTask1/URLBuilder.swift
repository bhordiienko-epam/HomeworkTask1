//
//  URLBuilder.swift
//  HomeworkTask1
//
//  Created by Bohdan Hordiienko on 12/9/19.
//  Copyright © 2019 HorBog. All rights reserved.
//

import Foundation

class URLBuilder {
    var components = URLComponents()
//    "https://www.random.org/strings/?num=10&len=8&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new"
    init() {
        components.scheme = "https"
        components.host = "www.random.org"
        components.path = "/strings/"
        components.queryItems = [
            URLQueryItem(name: "num", value: "10"),
            URLQueryItem(name: "len", value: "8"),
            URLQueryItem(name: "digits", value: "on"),
            URLQueryItem(name: "upperalpha", value: "on"),
            URLQueryItem(name: "loweralpha", value: "on"),
            URLQueryItem(name: "unique", value: "on"),
            URLQueryItem(name: "format", value: "plain"),
            URLQueryItem(name: "rnd", value: "new")
        ]
    }
    
    
    func getListUrl() -> URL? {
        return components.url
    }
}
