//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by Sofia Knezevic on 2017-03-15.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

import UIKit

class QuoteBuilderViewController: UIViewController {
    
    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var quoteBuilderLabel: UILabel!
    @IBOutlet weak var builderPhotoView: UIImageView!
    

    var quoteView:QuoteView?
    
    var quote:Quote?
    var photo:Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        quoteView = Bundle.main.loadNibNamed("QuoteView",
                                             owner: nil,
                                             options: nil)?.first! as? QuoteView
        
        quoteView?.frame.size = previewView.frame.size
        previewView.addSubview(quoteView!)
        
    }

    @IBAction func generateQuote(_ sender: UIButton)
    {
        QuoteManager.sharedInstance.getRandomQuote{(quote:Quote) in

            DispatchQueue.main.async {
                self.quoteBuilderLabel.text = quote.quote
                self.quote = quote
            }
        }

    }

    @IBAction func generateImage(_ sender: UIButton)
    {
        ImageManager.sharedInstance.getRandomPhoto{(photo:Photo) in
            
            DispatchQueue.main.async {
                
                self.builderPhotoView.image = photo.photo
                self.photo = photo
            
            }

        }
        
    }
    
    @IBAction func saveButton(_ sender: UIButton)
    {
        
        guard let photo = photo else {return}
        
        ImageManager.sharedInstance.photos.append(photo)
        
        self.quote?.quotePhoto = photo
        
        guard let quote = quote else {return}
        
        QuoteManager.sharedInstance.quotes.append(quote)
        
        quoteView?.setUpViewWithQuote(quote: quote)
        
    }

}
