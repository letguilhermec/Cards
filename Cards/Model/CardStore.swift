//
//  CardStore.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

class CardStore: ObservableObject {
  @Published var cards: [Card] = []
}
