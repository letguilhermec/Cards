//
//  ToolbarSelection.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import Foundation

enum ToolbarSelection: CaseIterable, Identifiable {
  var id: Int {
    hashValue
  }
  
  case photoModal, frameModal, stickerModal, textModal
}
