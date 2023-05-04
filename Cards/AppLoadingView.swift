//
//  AppLoadingView.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 04/05/23.
//

import SwiftUI

struct AppLoadingView: View {
  @State private var showSplash = true
  
  var body: some View {
    if showSplash {
      SplashScreen()
        .ignoresSafeArea()
    } else {
      CardsListView()
    }
  }
}

struct AppLoadingView_Previews: PreviewProvider {
  static var previews: some View {
    AppLoadingView()
      .environmentObject(CardStore(defaultData: true))
  }
}
