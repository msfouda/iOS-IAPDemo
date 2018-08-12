//
//  ViewController.swift
//  WidgetDemo
//
//  Updated by Mohamed Sobhy Fouda on /12/8/18.
//  Created by Hesham Abd-Elmegid on 6/27/16.
//  Copyright © 2016 CareerFoundry. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController {
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    let networking = Networking()
    
    override func viewDidAppear(_ animated: Bool) {
        getNewQuote(.Movies)
    }
    
    func getNewQuote(_ type: Networking.QuoteType) {
        quoteLabel.text = nil
        authorLabel.text = nil
        activityIndicator.startAnimating()
        
        networking.randomMoviesQuote(type) { (quote, error) in
            if let quote = quote {
                DispatchQueue.main.async {
                    self.quoteLabel.text = quote.text
                    self.authorLabel.text = quote.author
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    @IBAction func newQuoteButtonTapped(_ sender: AnyObject) {
        let quoteType = quoteTypeForSelectedSegmentedControlIndex()
        getNewQuote(quoteType)
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: AnyObject) {
        let segmentedControl = sender as! UISegmentedControl
        
        if segmentedControl.selectedSegmentIndex == 1 && !UpgradeManager.sharedInstance.hasUpgraded() {
            segmentedControl.selectedSegmentIndex = 0
            
            let alertController = UIAlertController(title: "Upgrade",
                                                    message: "Please upgrade to be able to view quotes from famous people",
                                                    preferredStyle: .alert)
            
            let upgradeAction = UIAlertAction(title: "Upgrade",
                                              style: .default,
                                              handler: { (action) in
                                                self.performSegue(withIdentifier: "ShowUpgradeViewController", sender: nil)
            })
            
            let laterAction = UIAlertAction(title: "Later",
                                            style: .cancel,
                                            handler: nil)
            
            alertController.addAction(upgradeAction)
            alertController.addAction(laterAction)
            
            present(alertController, animated: true, completion: nil)
        } else {
            let quoteType = quoteTypeForSelectedSegmentedControlIndex()
            getNewQuote(quoteType)
        }
    }
    
    func quoteTypeForSelectedSegmentedControlIndex() -> Networking.QuoteType {
        if segmentedControl.selectedSegmentIndex == 0 {
            return .Movies
        } else {
            return .FamousPeople
        }
    }
}

