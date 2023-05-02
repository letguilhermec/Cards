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
  
  mutating func addElement(uiImage: UIImage) {
    let element = ImageElement(uiImage: uiImage)
    elements.append(element)
  }
  
  mutating func addElement(text: TextElement) {
    elements.append(text)
  }
}
