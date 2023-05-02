//
//  CardToolbar.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

struct CardToolbar: ViewModifier {
  @Environment(\.dismiss) var dismiss
  @Binding var currentModal: ToolbarSelection?
  @Binding var card: Card
  @State private var stickerImage: UIImage?
  
  func body(content: Content) -> some View {
    content
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") {
            dismiss()
          }
        }
        ToolbarItem(placement: .bottomBar) {
          BottomToolbar(modal: $currentModal, card: $card)
        }
        ToolbarItem(placement: .navigationBarLeading) {
          PasteButton(payloadType: CustomTransfer.self) { items in
            Task {
              card.addElements(from: items)
            }
          }
          .labelStyle(.iconOnly)
          .buttonBorderShape(.capsule)
        }
      }
      .sheet(item: $currentModal) { item in
        switch item {
        case .stickerModal:
          StickerModal(stickerImage: $stickerImage)
            .onDisappear {
              if let stickerImage = stickerImage {
                card.addElement(uiImage: stickerImage)
              }
              stickerImage = nil
            }
        default:
          Text(String(describing: item))
        }
      }
  }
}
