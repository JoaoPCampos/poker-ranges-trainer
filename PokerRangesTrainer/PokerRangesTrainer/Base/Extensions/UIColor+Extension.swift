//
//  UIColor+Extension.swift
//
//  Created by João Campos
//  Copyright © 2023 João Campos. All rights reserved.
//

import UIKit

extension UIColor {


    /// value: #CD7F28
    static let dimbet = UIColor.named("dim-bet")
    /// value: #48A295
    static let dimcall = UIColor.named("dim-call")
    /// value: #8A8A8A
    static let dimfold = UIColor.named("dim-fold")
    /// value: #AC3139
    static let dimreraise = UIColor.named("dim-reraise")
    /// value: #F20033
    static var brakeLights: UIColor = UIColor.named("brake-lights")
    /// value: #FDFDFD
    static let brilliance = UIColor.named("brilliance")
    /// value: #232323
    static let goshawkGrey = UIColor.named("goshawk-grey")
    /// value: #009051
    static let moss = UIColor.named("moss")
    /// value: #191919
    static let nero = UIColor.named("nero")
    /// value: #0F0F0F
    static let pitch = UIColor.named("pitch")
    /// value: #FFE100
    static let bluff_4bet = UIColor.named("bluff_4bet")
    /// value: #00FF80
    static let call = UIColor.named("call")
    /// value: #C6FF95
    static let call_2x = UIColor.named("call_2.5x")
    /// value: #00E2FF
    static let call_duck = UIColor.named("call_duck")
    /// value: #FF5400
    static let call_or_4bet = UIColor.named("call_or_4bet")
    /// value: #FF2F92
    static let raise_3bet_4bet = UIColor.named("raise_3bet_4bet")
    /// value: #FF3377
    static let utg = UIColor.named("utg")
    /// value: #FF99BB
    static let mp = UIColor.named("mp")
    /// value: #226F54
    static let co = UIColor.named("co")
    /// value: #87C38F
    static let btn = UIColor.named("btn")
    /// value: #F4F0BB
    static let sb = UIColor.named("sb")
    /// value: #F0C039
    static let bb = UIColor.named("bb")
}

/// Private method
private extension UIColor {

    static func named(_ colorName: String) -> UIColor {

        guard let color = UIColor(named: colorName) else { preconditionFailure() }

        return color
    }
}
