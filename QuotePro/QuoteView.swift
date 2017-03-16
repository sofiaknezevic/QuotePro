//
//  QuoteView.swift
//  QuotePro
//
//  Created by Sofia Knezevic on 2017-03-15.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

import UIKit
import Nuke

class QuoteView: UIView {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!

    
    
    func setUpViewWithQuote(quote:Quote) -> Void {
        
        photoView.image = quote.quotePhoto?.photo
        quoteLabel.text = quote.quote
        authorLabel.text = quote.author
        
    }
    
}
