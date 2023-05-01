//
//  ResizableView.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

struct ResizableView: View {
  private let content = RoundedRectangle(cornerRadius: 30.0)
  private let color = Color.red
  
  var body: some View {
    content
      .frame(width: 250, height: 180)
      .foregroundColor(color)
  }
}

struct ResizableView_Previews: PreviewProvider {
  static var previews: some View {
    ResizableView()
  }
}
