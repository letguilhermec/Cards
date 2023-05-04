//
//  LayoutView.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 04/05/23.
//

// View for testing layouts
// --- TEST ---

import SwiftUI

struct LayoutView: View {
  var body: some View {
    HStack {
      Text("Hello, World!")
        .background(Color.red)
      Text("Hello, World!")
        .padding()
        .background(Color.red)
    }
    .background(Color.gray)
  }
}

struct LayoutView_Previews: PreviewProvider {
  static var previews: some View {
    LayoutView()
      .previewLayout(.fixed(width: 500, height: 300))
  }
}
