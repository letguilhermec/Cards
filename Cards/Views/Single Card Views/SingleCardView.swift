//
//  SingleCardView.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

struct SingleCardView: View {
  @Environment(\.dismiss) var dismiss
  @State private var currentModal: ToolbarSelection?
  
  var body: some View {
    NavigationStack {
      Color.yellow
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button("Done") {
              dismiss()
            }
          }
          ToolbarItem(placement: .bottomBar) {
            BottomToolbar(modal: $currentModal)
          }
        }
        .sheet(item: $currentModal) { item in
          switch item {
          default:
            Text(String(describing: item))
          }
        }
    }
  }
}

struct SingleCardView_Previews: PreviewProvider {
  static var previews: some View {
    SingleCardView()
  }
}