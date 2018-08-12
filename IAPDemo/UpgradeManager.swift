//
//  UpgradeManager.swift
//  IAPDemo
//
//  Updated by Mohamed Sobhy Fouda on /12/8/18.
//  Created by Hesham Abd-Elmegid on 8/18/16.
//  Copyright © 2016 CareerFoundry. All rights reserved.
//

import Foundation
import StoreKit

class UpgradeManager: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    static let sharedInstance = UpgradeManager()
    let productIdentifier = "com.careerfoundry.randomquotes.famouspeoplequotes"
    typealias SuccessHandler = (_ succeeded: Bool) -> (Void)
    var upgradeCompletionHandler: SuccessHandler?
    var restoreCompletionHandler: SuccessHandler?
    var priceCompletionHandler: ((_ price: Float) -> Void)?
    var famousQuotesProduct: SKProduct?

    func hasUpgraded() -> Bool {
        return false
    }
    
    func upgrade(_ success: @escaping SuccessHandler) {
        
    }
    
    func restorePurchases(_ success: @escaping SuccessHandler) {
        
    }
    
    func priceForUpgrade(_ success: @escaping (_ price: Float) -> Void) {
        success(0.0)
    }
    
    // MARK: SKPaymentTransactionObserver
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
    }
    
    // MARK: SKProductsRequestDelegate
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
    }
}
