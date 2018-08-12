//
//  Networking.swift
//  WidgetDemo
//
//  Updated by Mohamed Sobhy Fouda on /12/8/18.
//  Created by Hesham Abd-Elmegid on 6/27/16.
//  Copyright © 2016 CareerFoundry. All rights reserved.
//

import Foundation

class Networking: NSObject {
    enum QuoteType: String {
        case Movies = "movies"
        case FamousPeople = "famous"
    }
    
    typealias CompletionHandler = (_ quote: Quote?, _ error: NSError?) -> ()
    
    func randomMoviesQuote(_ type: QuoteType, completion: @escaping CompletionHandler) {
        let urlString = "https://andruxnet-random-famous-quotes.p.mashape.com/?cat=\(type.rawValue)"
        let apiURL = URL(string: urlString)
        var request = URLRequest(url: apiURL!)
        request.httpMethod = "POST"
        request.addValue("70kHu82V9Jmshv3cD2gNkUF915jsp1K0HlYjsnVcns7jvOI4O1", forHTTPHeaderField: "X-Mashape-Key")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            guard let data = data , error == nil else {
                print(error!)
                return
            }
            
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as! [Any]
                let quote = Quote(quoteDictionary: jsonResponse.first as! [String : String])
                completion(quote, nil)
            } catch {
                print("JSON error: \(error)")
            }
        }) 
        
        task.resume()
        
        
    }
}
