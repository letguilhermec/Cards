//
//  CardToolbar.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

struct CardToolbar: ViewModifier {
  @Environment(\.dismiss) var dismiss
  @EnvironmentObject var store: CardStore
  @Binding var currentModal: ToolbarSelection?
  @Binding var card: Card
  @State private var stickerImage: UIImage?
  @State private var frameIndex: Int?
  
  var menu: some View {
    Menu {
      Button {
        if UIPasteboard.general.hasImages {
          if let images = UIPasteboard.general.images {
            for image in images {
              card.addElement(uiImage: image)
            }
          }
        } else if UIPasteboard.general.hasStrings {
          if let strings = UIPasteboard.general.strings {
            for text in strings {
              card.addElement(text: TextElement(text: text))
            }
          }
        }
      } label: {
        Label("Paste", systemImage: "doc.on.clipboard")
      }
      .disabled(!UIPasteboard.general.hasImages
                && !UIPasteboard.general.hasStrings)
    } label: {
      Label("Add", systemImage: "ellipsis.circle")
    }
  }
  
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
        ToolbarItem(placement: .navigationBarTrailing) {
            menu
        }
      }
      .sheet(item: $currentModal) { item in
        switch item {
        case .frameModal:
          FrameModal(frameIndex: $frameIndex)
            .onDisappear {
              if let frameIndex {
                card.update(
                  store.selectedElement,
                  frameIndex: frameIndex)
              }
              frameIndex = nil
            }
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
