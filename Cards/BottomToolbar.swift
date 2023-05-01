//
//  BottomToolbar.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

struct ToolbarButton: View {
  var body: some View {
    VStack {
      Image(systemName: "heart.circle")
        .font(.largeTitle)
      Text("Stickers")
    }
    .padding(.top)
  }
}

struct BottomToolbar: View {
  @Binding var modal: ToolbarSelection?
  
  var body: some View {
    HStack {
      Button {
        modal = .stickerModal
      } label: {
        ToolbarButton()
      }
    }
  }
}

struct BottomToolbar_Previews: PreviewProvider {
  static var previews: some View {
    BottomToolbar(modal: .constant(.stickerModal))
      .padding()
  }
}
