//
//  BottomToolbar.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

struct ToolbarButton: View {
  let modal: ToolbarSelection
  
  private let modalButton: [
    ToolbarSelection: (text: String, imageName: String)
  ] = [
    .photoModal: ("Photos", "photo"),
    .frameModal: ("Frames", "square.on.circle"),
    .stickerModal: ("Stickers", "heart.circle"),
    .textModal: ("Text", "textformat")
  ]
  
  var body: some View {
    if let text = modalButton[modal]?.text,
       let imageName = modalButton[modal]?.imageName {
      VStack {
        Image(systemName: imageName)
          .font(.largeTitle)
        Text(text)
      }
      .padding(.top)
    }
  }
}

struct BottomToolbar: View {
  @EnvironmentObject var store: CardStore
  @Binding var modal: ToolbarSelection?
  @Binding var card: Card
  
  func defaultButton(_ selection: ToolbarSelection) -> some View {
    Button {
      modal = selection
    } label: {
      ToolbarButton(modal: selection)
    }
  }
  
  var body: some View {
    HStack {
      ForEach(ToolbarSelection.allCases) { selection in
        switch selection {
        case .photoModal:
          Button {
            //
          } label: {
            PhotosModal(card: $card)
          }
        case .frameModal:
          defaultButton(selection)
            .disabled(
              store.selectedElement == nil
              || !(store.selectedElement is ImageElement))
        default:
          defaultButton(selection)
        }
      }
    }
  }
}

struct BottomToolbar_Previews: PreviewProvider {
  static var previews: some View {
    BottomToolbar(
      modal: .constant(.stickerModal),
      card: .constant(Card()))
    .environmentObject(CardStore())
    .padding()
  }
}
