//
//  Card.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

struct Card: Identifiable {
  // Must have an ID property to conform to Identifiable's protocol
  let id = UUID()
  var backgroundColor: Color = .yellow
  var elements: [CardElement] = []
}
