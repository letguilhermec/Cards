//
//  SingleCardView.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

struct SingleCardView: View {
  @State private var currentModal: ToolbarSelection?
  let card: Card
  
  var content: some View {
    card.backgroundColor
  }
  
  var body: some View {
    NavigationStack {
      content
        .modifier(CardToolbar(currentModal: $currentModal))
    }
  }
}

struct SingleCardView_Previews: PreviewProvider {
  static var previews: some View {
    SingleCardView(card: initialCards[0])
  }
}
