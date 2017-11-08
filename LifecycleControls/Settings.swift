//
//  Settings.swift
//  LifecycleControls
//
//  Created by C4Q on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
import UIKit

enum capOption {
    case lower, upper, proper
}

class Settings {
    static var rowNum: Int = 10
    static var shouldAlternate: Bool = false
    static var capitalization: capOption = .lower
    static var color: (red: CGFloat, green: CGFloat, blue: CGFloat) = (red: 1, green: 1, blue: 1)
    
}
