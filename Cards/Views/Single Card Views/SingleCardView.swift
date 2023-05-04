//
//  SingleCardView.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

struct SingleCardView: View {
  @State private var currentModal: ToolbarSelection?
  @Binding var card: Card
  
  var body: some View {
    NavigationStack {
      GeometryReader { proxy in
        CardDetailView(
          card: $card,
          viewScale: Settings.calculateScale(proxy.size))
          .modifier(CardToolbar(
            currentModal: $currentModal,
            card: $card))
          .onDisappear {
            card.save()
          }
          .frame(
            width: Settings.calculateSize(proxy.size).width,
            height: Settings.calculateSize(proxy.size).height)
          .clipped()
          .frame(maxWidth: .infinity, maxHeight: .infinity)
      }
    }
  }
}

struct SingleCardView_Previews: PreviewProvider {
  struct SingleCardPreview: View {
    @EnvironmentObject var store: CardStore
    var body: some View {
      SingleCardView(card: $store.cards[0])
    }
  }
  static var previews: some View {
    SingleCardPreview()
      .environmentObject(CardStore(defaultData: true))
  }
}
