//
//  PublicData.swift
//  Plus One
//
//  Created by Issey Rollison on 16/11/19.
//  Copyright © 2019 Issey. All rights reserved.
//

import Foundation

class PublicData {
    static var theme = UserDefaults.standard.string(forKey: "colourTheme")
    static var mainTextColour = UserDefaults.standard.string(forKey: "mainTextColour")
}
