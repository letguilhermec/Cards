//
//  ViewExtensions.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 02/05/23.
//

import SwiftUI

extension View {
  func elementContextMenu(
    card: Binding<Card>,
    element: Binding<CardElement>
  ) -> some View {
    modifier(ElementContextMenu(
      card: card,
      element: element))
  }
}

extension View {
  @ViewBuilder
  func overlay(
    element: CardElement,
    isSelected: Bool
  ) -> some View {
    if isSelected,
       let element = element as? ImageElement,
       let frameIndex = element.frameIndex {
      let shape = Shapes.shapes[frameIndex]
      self.overlay(shape
        .stroke(lineWidth: Settings.borderWidth)
        .foregroundColor(Settings.borderColor))
    } else {
      self
        .border(
          Settings.borderColor,
          width: isSelected ? Settings.borderWidth : 0)
    }
  }
}
