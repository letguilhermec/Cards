//
//  CardsApp.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

@main
struct CardsApp: App {
  @StateObject var store = CardStore(defaultData: false)
  
  var body: some Scene {
    WindowGroup {
      CardsListView()
        .environmentObject(store)
        .onAppear {
          print(URL.documentsDirectory)
        }
    }
  }
}
