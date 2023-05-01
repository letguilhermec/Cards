//
//  CardsListView.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

struct CardsListView: View {
  var body: some View {
    ScrollView(showsIndicators: false) {
      VStack {
        ForEach(0..<10) { _ in
          CardThumbnail()
        }
      }
    }
  }
}

struct CardsListView_Previews: PreviewProvider {
  static var previews: some View {
    CardsListView()
  }
}

