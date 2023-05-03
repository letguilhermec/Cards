//
//  Shapes.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 03/05/23.
//

import SwiftUI

enum Shapes {
  static let shapes: [AnyShape] = [
    AnyShape(Circle()), AnyShape(Capsule()), AnyShape(Rectangle()), AnyShape(RoundedRectangle(cornerRadius: 25.0)), AnyShape(Heart()), AnyShape(Lens()), AnyShape(ArrowPolygon()), AnyShape(Diamond()), AnyShape(Polygon(sides: 4)), AnyShape(Cone()), AnyShape(Triangle()), AnyShape(Polygon(sides: 6)), AnyShape(Polygon(sides: 8)), AnyShape(Polygon(sides: 10))
  ]
}

struct Triangle: Shape {
  func path(in rect: CGRect) -> Path {
    let width = rect.width
    let height = rect.height
    var path = Path()
    path.addLines([
      CGPoint(x: width * 0.13, y: height * 0.2),
      CGPoint(x: width * 0.87, y: height * 0.47),
      CGPoint(x: width * 0.4, y: height * 0.93),
    ])
    path.closeSubpath()
    return path
  }
}

struct Cone: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let radius = min(rect.midX, rect.midY)
    path.addArc(
      center: CGPoint(x: rect.midX, y: rect.midY),
      radius: radius,
      startAngle: Angle(degrees: 0),
      endAngle: Angle(degrees: 180),
      clockwise: true
    )
    path.addLine(to: CGPoint(x: rect.midX, y: rect.height))
    path.addLine(to: CGPoint(x: rect.midX + radius, y: rect.midY))
    path.closeSubpath()
    return path
  }
}

struct Lens: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: 0, y: rect.midY))
    path.addQuadCurve(
      to: CGPoint(x: rect.width, y: rect.midY),
      control: CGPoint(x: rect.midX, y: 0))
    path.addQuadCurve(
      to: CGPoint(x: 0, y: rect.midY),
      control: CGPoint(x: rect.midX, y: rect.height))
    path.closeSubpath()
    return path
  }
}

struct Heart: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let sideOne = rect.width * 0.4
    let sideTwo = rect.height * 0.3
    let arcRadius = sqrt(sideOne * sideOne + sideTwo * sideTwo) / 2
    path.addArc(
      center: CGPoint(x: rect.width * 0.3, y: rect.height * 0.35),
      radius: arcRadius,
      startAngle: Angle(degrees: 135),
      endAngle: Angle(degrees: 315),
      clockwise: false)
    path.addLine(to: CGPoint(x: rect.width / 2, y: rect.height * 0.2))
    path.addArc(
      center: CGPoint(x: rect.width * 0.7, y: rect.height * 0.35),
      radius: arcRadius,
      startAngle: Angle(degrees: 225),
      endAngle: Angle(degrees: 45),
      clockwise: false)
    path.addLine(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.95))
    path.closeSubpath()
    return path
  }
}

struct ArrowPolygon: Shape {
  func path(in rect: CGRect) -> Path {
    let width = rect.width
    let height = rect.height
    var path = Path()
    path.addLines([
      CGPoint(x: width * 0.13, y: height * 0.067),
      CGPoint(x: width * 0.67, y: height * 0.067),
      CGPoint(x: width * 0.87, y: height * 0.5),
      CGPoint(x: width * 0.67, y: height * 0.94),
      CGPoint(x: width * 0.13, y: height * 0.94),
      CGPoint(x: width * 0.34, y: height * 0.5),
    ])
    path.closeSubpath()
    return path
  }
}

struct Diamond: Shape {
  func path(in rect: CGRect) -> Path {
    let width = rect.width
    let height = rect.height
    var path = Path()
    path.addLines([
      CGPoint(x: width * 0.5, y: height * 0.05),
      CGPoint(x: width * 0.95, y: height * 0.5),
      CGPoint(x: width * 0.5, y: height * 0.95),
      CGPoint(x: width * 0.05, y: height * 0.5)
    ])
    path.closeSubpath()
    return path
  }
}

struct Polygon: Shape {
  let sides: Int
  func path(in rect: CGRect) -> Path {
    return RoundedPolygon(rect: rect, lineWidth: 10.0, sides: sides)
  }
}

func RoundedPolygon(rect: CGRect, lineWidth:CGFloat, sides: Int, cornerRadius: CGFloat = 20, rotationOffset: CGFloat = 0) -> Path {
  var path = Path()
  let theta = CGFloat(2.0 * Double.pi) / CGFloat(sides)
  let offset = cornerRadius * tan(theta / 2.0)
  let width = min(rect.size.width, rect.size.height)
  
  let center = CGPoint(x: rect.origin.x + width / 2.0, y: rect.origin.y + width / 2.0)
  let radius = (width - lineWidth + cornerRadius - (cos(theta) * cornerRadius)) / 2.0
  var angle = CGFloat(rotationOffset)
  let corner = CGPoint(x: center.x + (radius - cornerRadius) * cos(angle), y: center.y + (radius - cornerRadius) * sin(angle))
  
  path.move(to: CGPoint(x: corner.x + cornerRadius * cos(angle + theta), y: corner.y + cornerRadius * sin(angle + theta)))
  
  for _ in 0..<sides {
    angle += theta
    
    let corner = CGPoint(x: center.x + (radius - cornerRadius) * cos(angle), y: center.y + (radius - cornerRadius) * sin(angle))
    let tip = CGPoint(x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
    let start = CGPoint(x: corner.x + cornerRadius * cos(angle - theta), y: corner.y + cornerRadius * sin(angle - theta))
    let end = CGPoint(x: corner.x + cornerRadius * cos(angle + theta), y: corner.y + cornerRadius * sin(angle + theta))
    
    path.addLine(to: start)
    path.addQuadCurve(to: end, control: tip)
  }
  path.closeSubpath()
  
  return path
}

struct Shapes_Previews: PreviewProvider {
  static var previews: some View {
    Polygon(sides: 4)
      .stroke(
        Color.primary,
        style: StrokeStyle(lineWidth: 10, lineJoin: .round))
      .padding()
      .aspectRatio(1, contentMode: .fit)
      .background(Color.yellow)
      .previewLayout(.sizeThatFits)
  }
}
