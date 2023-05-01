//
//  CardsListView.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

struct CardsListView: View {
  @State private var isPresented = false
  
  var body: some View {
    ScrollView(showsIndicators: false) {
      VStack {
        ForEach(0..<10) { _ in
          CardThumbnail()
            .onTapGesture {
              isPresented = true
            }
        }
      }
    }
    .fullScreenCover(isPresented: $isPresented) {
      SingleCardView()
    }
  }
}

struct CardsListView_Previews: PreviewProvider {
  static var previews: some View {
    CardsListView()
  }
}

