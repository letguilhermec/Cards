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
          .resizableView(transform: $element.transform)
          .frame(
            width: element.transform.size.width,
            height: element.transform.size.height)
      }
    }
    .dropDestination(for: UIImage.self) { images, location in
      print(location)
      for image in images {
        card.addElement(uiImage: image)
      }
      return !images.isEmpty
    }
  }
}

struct CardDetailView_Previews: PreviewProvider {
  struct CardDetailPreview: View {
    @EnvironmentObject var store: CardStore
    
    var body: some View {
      CardDetailView(card: $store.cards[0])
    }
  }
  static var previews: some View {
    CardDetailPreview()
      .environmentObject(CardStore(defaultData: true))
  }
}
