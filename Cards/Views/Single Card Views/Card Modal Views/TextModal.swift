//
//  TextModal.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 04/05/23.
//

import SwiftUI

struct TextModal: View {
  @Binding var text: TextElement
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    let onCommit = {
      dismiss()
    }
    TextField(
      "Enter Text",
      text: $text.text,
      onCommit: onCommit)
    .padding(20)
  }
}

struct TextModal_Previews: PreviewProvider {
  static var previews: some View {
    TextModal(text: .constant(TextElement()))
  }
}
