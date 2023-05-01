//
//  Operators.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import Foundation
import SwiftUI

// Operator overloading
// Redefines '+' with a new method
func + (left: CGSize, right: CGSize) -> CGSize {
  CGSize(
    width: left.width + right.width,
    height: left.height + right.height)
}
