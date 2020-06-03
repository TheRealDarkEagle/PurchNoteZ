//
//  DateExtension.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 14.05.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import Foundation

extension Date {
    var fullStringRepresentation: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh.dd.MM.yyyy"
        return formatter.string(from: self)
    }
}
