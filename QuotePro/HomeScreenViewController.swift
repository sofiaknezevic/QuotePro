//
//  HomeScreenViewController.swift
//  QuotePro
//
//  Created by Sofia Knezevic on 2017-03-15.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource

{
    
    private let quoteBuilderIdentifier = "showQuoteBuilder"
    
    @IBOutlet weak var tableView: UITableView!


    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(title: "+",
                                        style: UIBarButtonItemStyle.plain,
                                        target: self,
                                        action: #selector(insertNewQuote))
        
        
        self.navigationItem.rightBarButtonItem = addButton
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.insertNewQuote()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        
        self.tableView.reloadData()
        
    }

    func insertNewQuote() -> Void
    {
        performSegue(withIdentifier: quoteBuilderIdentifier, sender: self)
    }


    func numberOfSections(in tableView: UITableView) -> Int
    {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return QuoteManager.sharedInstance.quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? HomeScreenTableViewCell
        
        let quote = QuoteManager.sharedInstance.quotes[indexPath.row]
        cell?.configureCellWithQuote(quote: quote)
        
        return cell!
    }
    

}
