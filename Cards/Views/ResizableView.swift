//
//  ResizableView.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

struct ResizableView: ViewModifier {
  @Binding var transform: Transform
  @State private var previousOffset: CGSize = .zero
  @State private var previousRotation: Angle = .zero
  @State private var scale: CGFloat = 1.0
  
  let viewScale: CGFloat
  
  var dragGesture: some Gesture {
    DragGesture()
      .onChanged { value in
        // Operators.swift + overload
        transform.offset = value.translation / viewScale + previousOffset
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
  var scaleGesture: some Gesture {
    MagnificationGesture()
      .onChanged { scale in
        self.scale = scale
      }
      .onEnded { scale in
        transform.size.width *= scale
        transform.size.height *= scale
        self.scale = 1.0
      }
  }
  
  func body(content: Content) -> some View {
    content
      .frame(
        width: transform.size.width * viewScale,
        height: transform.size.height * viewScale)
      .rotationEffect(transform.rotation)
      .scaleEffect(scale)
      .offset(transform.offset * viewScale)
      .gesture(dragGesture)
      .gesture(SimultaneousGesture(rotationGesture, scaleGesture))
      .onAppear {
        previousOffset = transform.offset
      }
  }
}

struct ResizableView_Previews: PreviewProvider {
  static var previews: some View {
      RoundedRectangle(cornerRadius: 30)
      .foregroundColor(Color.blue)
      .resizableView(transform: .constant(Transform()))
  }
}

// Adds a pass-through method to View
// Allowing the use of .resizableView() instead of .modifier(ResizableView())
extension View {
  func resizableView(
    transform: Binding<Transform>,
    viewScale: CGFloat = 1.0
  ) -> some View {
    modifier(ResizableView(
      transform: transform,
      viewScale: viewScale))
  }
}
