//
//  QuotesAPI.swift
//  GetGood
//
//  Created by Hiago Chagas on 14/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import Foundation
struct Quote: Decodable{
    let text: String
    let author: String?
}
class QuoteRequest{
    var quoteResult: [Quote] = []
    let apiURL = "https://type.fit/api/quotes"
    
    func fetchQuotes(session: URLSession = URLSession.shared, completion: @escaping ([Quote]?, Error?) -> ()) {
        guard let url = URL(string: apiURL) else {fatalError()}
        let task = session.dataTask(with: url){ data, response, error in
            if error != nil{
                completion(nil, error)
                return
            }
            do{
                let decoder = JSONDecoder()
                self.quoteResult = try decoder.decode([Quote].self,from: data!)
                completion(self.quoteResult, nil)
            } catch {
                completion(nil, error)
                return
            }
        }
        task.resume()
    }
}


