//
//  Shapes.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 03/05/23.
//

import SwiftUI


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

//struct Polygon: Shape {
//  let sides: Int
//  func path(in rect: CGRect) -> Path {
//    return RoundedPolygon(rect: rect, lineWidth: 10.0, sides: sides)
//  }
//}

//func RoundedPolygon(rect: CGRect, lineWidth:CGFloat, sides: Int, cornerRadius: CGFloat = 20, rotationOffset: CGFloat = 0) -> Path {
//  var path = Path()
//  let theta = CGFloat(2.0 * Double.pi) / CGFloat(sides)
//  let offset = cornerRadius * tan(theta / 2.0)
//  let width = min(rect.size.width, rect.size.height)
//
//  let center = CGPoint(x: rect.origin.x + width / 2.0, y: rect.origin.y + rect.size.height / 2.0)
//  let radius = (width - lineWidth + cornerRadius - (cos(theta) * cornerRadius)) / 2.0
//  var angle = CGFloat(rotationOffset)
//  let corner = CGPoint(x: center.x + (radius - cornerRadius) * cos(angle), y: center.y + (radius - cornerRadius) * sin(angle))
//
//  path.move(to: CGPoint(x: corner.x + cornerRadius * cos(angle + theta), y: corner.y + cornerRadius * sin(angle + theta)))
//
//  for _ in 0..<sides {
//    angle += theta
//
//    let corner = CGPoint(x: center.x + (radius - cornerRadius) * cos(angle), y: center.y + (radius - cornerRadius) * sin(angle))
//    let tip = CGPoint(x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
//    let start = CGPoint(x: corner.x + cornerRadius * cos(angle - theta), y: corner.y + cornerRadius * sin(angle - theta))
//    let end = CGPoint(x: corner.x + cornerRadius * cos(angle + theta), y: corner.y + cornerRadius * sin(angle + theta))
//
//    path.addLine(to: start)
//    path.addQuadCurve(to: end, control: tip)
//  }
//  path.closeSubpath()
//
//  let bounds = path.boundingRect
//  let transform = CGAffineTransformMakeTranslation(-bounds.origin.x + rect.origin.x + lineWidth / 2.0, -bounds.origin.y + rect.origin.y + lineWidth / 2.0)
//  path = path.applying(transform)
//
//  return path
//}

struct Star: Shape {
    // store how many corners the star has, and how smooth/pointed it is
    let corners: Int
    let smoothness: Double

    func path(in rect: CGRect) -> Path {
        // ensure we have at least two corners, otherwise send back an empty path
        guard corners >= 2 else { return Path() }

        // draw from the center of our rectangle
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)

        // start from directly upwards (as opposed to down or to the right)
        var currentAngle = -CGFloat.pi / 2

        // calculate how much we need to move with each star corner
        let angleAdjustment = .pi * 2 / Double(corners * 2)

        // figure out how much we need to move X/Y for the inner points of the star
        let innerX = center.x * smoothness
        let innerY = center.y * smoothness

        // we're ready to start with our path now
        var path = Path()

        // move to our initial position
        path.move(to: CGPoint(x: center.x * cos(currentAngle), y: center.y * sin(currentAngle)))

        // track the lowest point we draw to, so we can center later
        var bottomEdge: Double = 0

        // loop over all our points/inner points
        for corner in 0..<corners * 2  {
            // figure out the location of this point
            let sinAngle = sin(currentAngle)
            let cosAngle = cos(currentAngle)
            let bottom: Double

            // if we're a multiple of 2 we are drawing the outer edge of the star
            if corner.isMultiple(of: 2) {
                // store this Y position
                bottom = center.y * sinAngle

                // …and add a line to there
                path.addLine(to: CGPoint(x: center.x * cosAngle, y: bottom))
            } else {
                // we're not a multiple of 2, which means we're drawing an inner point

                // store this Y position
                bottom = innerY * sinAngle

                // …and add a line to there
                path.addLine(to: CGPoint(x: innerX * cosAngle, y: bottom))
            }

            // if this new bottom point is our lowest, stash it away for later
            if bottom > bottomEdge {
                bottomEdge = bottom
            }

            // move on to the next corner
            currentAngle += angleAdjustment
        }
      path.closeSubpath()

        // figure out how much unused space we have at the bottom of our drawing rectangle
        let unusedSpace = (rect.height / 2 - bottomEdge) / 2

        // create and apply a transform that moves our path down by that amount, centering the shape vertically
        let transform = CGAffineTransform(translationX: center.x, y: center.y + unusedSpace)
        return path.applying(transform)
    }
}

enum Shapes {
  static let shapes: [AnyShape] = [
    AnyShape(Circle()), AnyShape(Capsule()), AnyShape(Rectangle()), AnyShape(RoundedRectangle(cornerRadius: 25.0)), AnyShape(Heart()), AnyShape(Lens()), AnyShape(ArrowPolygon()), AnyShape(Diamond()), AnyShape(Star(corners: 3, smoothness: 0.5)), AnyShape(Cone()), AnyShape(Triangle()), AnyShape(Star(corners: 3, smoothness: 0.75)), AnyShape(Star(corners: 4, smoothness: 0.6)), AnyShape(Star(corners: 4, smoothness: 0.85)), AnyShape(Star(corners: 5, smoothness: 0.6)), AnyShape(Star(corners: 5, smoothness: 0.8)), AnyShape(Star(corners: 6, smoothness: 0.8))
  ]
}

struct Shapes_Previews: PreviewProvider {
  static var previews: some View {
    Star(corners: 6, smoothness: 0.8)
      .stroke(
        Color.primary,
        style: StrokeStyle(lineWidth: 10, lineJoin: .round))
      .padding()
      .aspectRatio(1, contentMode: .fit)
      .background(Color.yellow)
      .previewLayout(.sizeThatFits)
  }
}
