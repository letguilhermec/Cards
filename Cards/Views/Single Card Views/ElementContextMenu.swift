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
      .contextMenu {
        // Copy
        Button {
          if let element = element as? TextElement {
            UIPasteboard.general.string = element.text
          } else if let element = element as? ImageElement,
                    let image = element.uiImage {
            UIPasteboard.general.image = image
          }
        } label: {
          Label("Copy", systemImage: "doc.on.doc")
        }
        // Delete
        Button(role: .destructive) {
          card.remove(element)
        } label: {
          Label("Delete", systemImage: "trash")
        }
      }
  }
}
