//
//  ColorExtensions.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

extension Color {
  static let colors: [Color] = [
    .green, .red, .blue, .gray, .yellow, .pink, .orange, .purple
  ]
  
  static func random() -> Color {
    colors.randomElement() ?? .black
  }
}
