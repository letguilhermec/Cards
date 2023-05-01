//
//  ResizableView.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

struct ResizableView: View {
  @State private var transform = Transform()
  @State private var previousOffset: CGSize = .zero
  @State private var previousRotation: Angle = .zero
  private let content = RoundedRectangle(cornerRadius: 30.0)
  private let color = Color.red
  var dragGesture: some Gesture {
    DragGesture()
      .onChanged { value in
        // Operators.swift + overload
        transform.offset = value.translation + previousOffset
      }
      .onEnded { _ in
        previousOffset = transform.offset
      }
  }
  var rotationGesture: some Gesture {
    RotationGesture()
      .onChanged { rotation in
        transform.rotation += rotation - previousRotation
        previousRotation = rotation
      }
      .onEnded { _ in
        previousRotation = .zero
      }
  }
  
  var body: some View {
    content
      .frame(width: transform.size.width, height: transform.size.height)
      .foregroundColor(color)
      .offset(transform.offset)
      .rotationEffect(transform.rotation)
      .gesture(dragGesture)
      .gesture(rotationGesture)
  }
}

struct ResizableView_Previews: PreviewProvider {
  static var previews: some View {
    ResizableView()
  }
}
