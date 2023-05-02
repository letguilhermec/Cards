//
//  CardDetailView.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

struct CardDetailView: View {
  @EnvironmentObject var store: CardStore
  @Binding var card: Card
  
  var body: some View {
    ZStack {
      card.backgroundColor
      ForEach($card.elements, id: \.id) { $element in
        CardElementView(element: element)
          .resizableView()
          .frame(
            width: element.transform.size.width,
            height: element.transform.size.height)
      }
    }
  }
}

struct CardDetailView_Previews: PreviewProvider {
  static var previews: some View {
    CardDetailView(card: .constant(initialCards[0]))
      .environmentObject(CardStore(defaultData: true))
  }
}
