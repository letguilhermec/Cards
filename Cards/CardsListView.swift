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
          RoundedRectangle(cornerRadius: 15)
            .foregroundColor(.gray)
            .frame(width: 150, height: 250)
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
