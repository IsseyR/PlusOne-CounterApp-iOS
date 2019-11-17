//
//  PublicData.swift
//  Plus One
//
//  Created by Issey Rollison on 16/11/19.
//  Copyright © 2019 Issey. All rights reserved.
//

import UIKit

class PublicData {
    static var theme = UserDefaults.standard.string(forKey: "colourTheme")
    static var textColour = PublicData.theme == "Dark" ? UIColor.white : UIColor.black
    static var titleAttributes = [NSAttributedString.Key.foregroundColor: PublicData.textColour]

        
    static func updateData() {
        PublicData.theme = UserDefaults.standard.string(forKey: "colourTheme")
        PublicData.textColour = PublicData.theme == "Dark" ? UIColor.white : UIColor.black
        PublicData.titleAttributes = [NSAttributedString.Key.foregroundColor: PublicData.textColour]
    }
}
