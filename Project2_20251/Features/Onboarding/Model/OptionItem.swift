//
//  OptionItem.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 23/10/25.
//

import Foundation
import SwiftUI

struct OptionItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let systemImage: String
    let tint: Color
}
