//
//  HomeScreenViewController.swift
//  QuotePro
//
//  Created by Sofia Knezevic on 2017-03-15.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController
{
    
    private let quoteBuilderIdentifier = "showQuoteBuilder"

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(title: "+",
                                        style: UIBarButtonItemStyle.plain,
                                        target: self,
                                        action: #selector(insertNewQuote))
        
        
        self.navigationItem.rightBarButtonItem = addButton
    }

    func insertNewQuote() -> Void
    {
        performSegue(withIdentifier: quoteBuilderIdentifier, sender: self)
    }



}
