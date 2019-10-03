//
//  Service.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit

enum NetworkError: LocalizedError {
    case malformedURL
    
    var errorDescription: String? {
        switch self {
            case .malformedURL:
                return "network_error_malformed_url".localized()
        }
    }
}

protocol Service {
    func invoke(endpoint: String, parameters: [String: String], success: @escaping (Data?, URLResponse?) -> (), failure: @escaping (Error?) -> ())
}

extension Service {
    func invoke(endpoint: String, parameters: [String: String] = [:], success: @escaping (Data?, URLResponse?) -> (), failure: @escaping (Error?) -> ()) {
        
        let urlParameters = (parameters.compactMap({ (name, parameter) -> String in
            return "\(name)=\(parameter.escaped())"
        }) as Array).joined(separator: "&")

        let encoded = "\(endpoint)?fmt=json&\(urlParameters)"
        
        guard let url = URL(string: encoded) else {
            failure(NetworkError.malformedURL); return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            error == nil ? success(data, response) : failure(error)
        }

        task.resume()
    }
}
