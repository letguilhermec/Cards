//
//  ElementContextMenu.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 02/05/23.
//

import SwiftUI

struct ElementContextMenu: ViewModifier {
  @Binding var card: Card
  @Binding var element: CardElement
  
  func body(content: Content) -> some View {
    content
  }
}
