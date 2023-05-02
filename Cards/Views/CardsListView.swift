//
//  CardsListView.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

struct CardsListView: View {
  @State private var selectedCard: Card?
  @EnvironmentObject var store: CardStore
  
  var body: some View {
    list
      .fullScreenCover(item: $selectedCard) { card in
        SingleCardView(card: card)
      }
  }
  
  var list: some View {
    ScrollView(showsIndicators: false) {
      VStack {
        ForEach(store.cards) { card in
          CardThumbnail(card: card)
            .onTapGesture {
              selectedCard = card
            }
        }
      }
    }
  }
}

struct CardsListView_Previews: PreviewProvider {
  static var previews: some View {
    CardsListView()
      .environmentObject(CardStore(defaultData: true))
  }
}

