//
//  PhotosModal.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 02/05/23.
//

import SwiftUI
import PhotosUI

struct PhotosModal: View {
  @Binding var card: Card
  @State private var selectedItems: [PhotosPickerItem] = []
  
  var body: some View {
    PhotosPicker(
      selection: $selectedItems,
      matching: .images) {
        ToolbarButton(modal: .photoModal)
      }
  }
}

struct PhotosModal_Previews: PreviewProvider {
  static var previews: some View {
    PhotosModal(card: .constant(Card()))
  }
}
