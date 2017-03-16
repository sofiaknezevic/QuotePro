//
//  ImageManager.swift
//  QuotePro
//
//  Created by Sofia Knezevic on 2017-03-15.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

import UIKit

class ImageManager: NSObject
{
    static let sharedInstance: ImageManager = {
        let shared = ImageManager()
        return shared
    }()
    
    var photos = [Photo]()
    
    func getRandomPhoto(completionHandler:@escaping (Photo)->Void)
    {
        
        let url = URL(string: "http://lorempixel.com/300/300")
        let request = URLRequest(url: url!)
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration:sessionConfiguration)
        
        
        let dataTask = session.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            
            guard let data = data else
            {
                
                print("No data \(error?.localizedDescription)")
                return
            }
            guard let resp = response as? HTTPURLResponse else
            {
                
                print("No response \(error)")
                return
            }
            
            guard resp.statusCode == 200 else
            {
                
                print(resp.statusCode)
                return
            }
            
            let photo = Photo(photo: UIImage(data: data)!)
            
            self.photos.append(photo)
            
            completionHandler(photo)
        }
        dataTask.resume()
    }
}
