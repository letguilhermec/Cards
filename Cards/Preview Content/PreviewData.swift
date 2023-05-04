//
//  PreviewData.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

let initialCards: [Card] = [
  Card(backgroundColor: Color("random1"), elements: initialElements),
  Card(backgroundColor: Color("random2")),
  Card(backgroundColor: Color("random3")),
  Card(backgroundColor: Color("random4")),
  Card(backgroundColor: Color("random8"))
]

let initialElements: [CardElement] = [
  ImageElement(
    transform: Transform(
      size: CGSize(width: 250, height: 180),
      offset: CGSize(width: 27, height: -140)),
    uiImage: UIImage(named: "giraffe3")),
  ImageElement(
    transform: Transform(
      size: CGSize(width: 380, height: 270),
      offset: CGSize(width: -80, height: 25)),
    uiImage: UIImage(named: "giraffe2")),
  ImageElement(
    transform: Transform(
      size: CGSize(width: 250, height: 180),
      offset: CGSize(width: 80, height: 205)),
    uiImage: UIImage(named: "giraffe1")),
  TextElement(
    transform: Transform(
      size: Settings.defaultElementSize * 1.1,
      offset: CGSize(width: 10, height: -275)),
    text: "Giraffes!!!",
    textColor: .black)
]
