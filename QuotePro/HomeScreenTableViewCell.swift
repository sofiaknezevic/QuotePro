//
//  HomeScreenTableViewCell.swift
//  QuotePro
//
//  Created by Sofia Knezevic on 2017-03-15.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

import UIKit

class HomeScreenTableViewCell: UITableViewCell
{

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configureCellWithQuote(quote:Quote) -> Void
    {
        containerView.layer.borderWidth = 1
        containerView.layer.masksToBounds = false
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.cornerRadius = previewImageView.frame.height/2
        containerView.clipsToBounds = true
        
        previewImageView.image = quote.snapshotImage
        quoteLabel.text = quote.quote
        authorLabel.text = quote.author
        
    }

}
