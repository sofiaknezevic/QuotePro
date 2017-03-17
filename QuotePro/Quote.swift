//
//  Quote.swift
//  QuotePro
//
//  Created by Sofia Knezevic on 2017-03-15.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

import UIKit

class Quote: NSObject {
    
    var quote:String?
    var author:String?
    
    var quotePhoto:Photo?
    var snapshotImage:UIImage?
    
    
 
    init(quote:String, author:String)
    {
        self.author = author
        self.quote = quote
        
    }
    


}
