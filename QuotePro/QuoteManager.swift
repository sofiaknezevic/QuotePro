//
//  QuoteManager.swift
//  QuotePro
//
//  Created by Sofia Knezevic on 2017-03-15.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

import UIKit
import Nuke

class QuoteManager: NSObject
{

    static let sharedInstance: QuoteManager = {
        let shared = QuoteManager()
        return shared
    }()
    
    
    var quotes = [Quote]()
    
    func getRandomQuote(completionHandler:@escaping (Quote)->Void) {
        
        let url = URL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")
        let request = URLRequest(url: url!)
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration:sessionConfiguration)
        
        
        let dataTask = session.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            
            guard let data = data else
            {
                
                print("No data, \(error?.localizedDescription)")
                return
            }
            guard let resp = response as? HTTPURLResponse else
            {
                
                print("No response, \(error)")
                return
            }
            
            guard resp.statusCode == 200 else
            {
                
                print(resp.statusCode)
                return
            }
            
            var jsonObject:[String: String]?
            
            do { jsonObject = try JSONSerialization.jsonObject(with: data) as? Dictionary<String, String> }
                
            catch { print(error.localizedDescription) }
            
            guard let json = jsonObject else {
                
                print("Error with JSON!")
                return
            }
            
            let quoteText = json["quoteText"]!
            
            let quoteAuthor = json["quoteAuthor"]!
            
            let quote = Quote(quote: quoteText, author: quoteAuthor)
            self.quotes.append(quote)
            
            completionHandler(quote)
        }
        dataTask.resume()
    }
    
}
