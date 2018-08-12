//
//  Quote.swift
//  WidgetDemo
//
//  Updated by Mohamed Sobhy Fouda on /12/8/18.
//  Created by Hesham Abd-Elmegid on 6/27/16.
//  Copyright © 2016 CareerFoundry. All rights reserved.
//

import Foundation

class Quote: NSObject {
    let text: String
    let author: String
        
    init(quoteDictionary: [String:String]) {
        text = quoteDictionary["quote"]!
        author = quoteDictionary["author"]!
    }
    
}
