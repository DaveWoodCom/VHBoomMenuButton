//
//  OrderEnum.swift
//  BoomMenuButton
//
//  Created by Nightonke on 2017/4/27.
//  Copyright © 2017 Nightonke. All rights reserved.
//

/// The order of boom-buttons when booming or rebooming.
///
/// - inOrder: In-order.
/// - reverse: Reverse.
/// - random: Random.
public enum OrderEnum: Int {
    
    /// In-order.
    case inOrder = 0
    /// Reverse.
    case reverse
    /// Random.
    case random
    
    static var count: Int {
        return OrderEnum.random.rawValue + 1
    }
}
