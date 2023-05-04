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
  @Environment(\.scenePhase) private var scenePhase
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  @Environment(\.verticalSizeClass) var verticalSizeClass
  
  var createButton: some View {
    Button {
      selectedCard = store.addCard()
    } label: {
      Label("Create New", systemImage: "plus")
        .frame(maxWidth: .infinity)
    }
    .font(.system(size: 16, weight: .bold))
    .padding([.top, .bottom], 10)
    .background(Color("barColor"))
  }
  
  var thumbnailSize: CGSize {
    var scale: CGFloat = 1
    if verticalSizeClass == .regular,
       horizontalSizeClass == .regular {
      scale = 1.5
    }
    return Settings.thumbnailSize * scale
  }
  
  var columns: [GridItem] {
    [
      GridItem(.adaptive(
        minimum: thumbnailSize.width))
    ]
  }
  
  var body: some View {
    VStack {
      list
        .fullScreenCover(item: $selectedCard) { card in
          if let index = store.index(for: card) {
            SingleCardView(card: $store.cards[index])
              .onChange(of: scenePhase) { newScenePhase in
                if newScenePhase == .inactive {
                  store.cards[index].save()
                }
              }
          } else {
            fatalError("Unable to locate selected card")
          }
        }
        .onAppear {
          //print(URL.documentsDirectory)
        }
    createButton
    }
    .background(
      Color("background")
        .ignoresSafeArea())
  }
  
  var list: some View {
    ScrollView(showsIndicators: false) {
      LazyVGrid(columns: columns, spacing: 30) {
        ForEach(store.cards) { card in
          CardThumbnail(card: card)
            .contextMenu {
              Button(role: .destructive) {
                store.remove(card)
              } label: {
                Label("Delete", systemImage: "trash")
              }
            }
            .frame(
              width: thumbnailSize.width,
              height: thumbnailSize.height)
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

