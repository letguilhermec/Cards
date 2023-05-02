//
//  CardStore.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

// Main data store and single source of truth
class CardStore: ObservableObject {
  @Published var cards: [Card] = []
  
  init(defaultData: Bool = false) {
    if defaultData {
      cards = initialCards
    }
  }
}
