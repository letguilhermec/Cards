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
  @State private var transform = Transform()
  
  var body: some View {
    content
      .frame(width: transform.size.width, height: transform.size.height)
      .foregroundColor(color)
  }
}

struct ResizableView_Previews: PreviewProvider {
  static var previews: some View {
    ResizableView()
  }
}
