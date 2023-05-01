//
//  ResizableView.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

struct ResizableView: View {
  @State private var transform = Transform()
  private let content = RoundedRectangle(cornerRadius: 30.0)
  private let color = Color.red
  var dragGesture: some Gesture {
    DragGesture()
      .onChanged { value in
        transform.offset = value.translation
      }
  }
  
  var body: some View {
    content
      .frame(width: transform.size.width, height: transform.size.height)
      .foregroundColor(color)
      .offset(transform.offset)
      .gesture(dragGesture)
  }
}

struct ResizableView_Previews: PreviewProvider {
  static var previews: some View {
    ResizableView()
  }
}
