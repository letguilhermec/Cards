//
//  Card.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

struct Card: Identifiable {
  // Must have an ID property to conform to Identifiable's protocol
  var id = UUID()
  var backgroundColor: Color = .yellow
  var elements: [CardElement] = []
  
  mutating func addElement(uiImage: UIImage, at offset: CGSize = .zero) {
    let imageFilename = uiImage.save()
    let transform = Transform(offset: offset)
    let element = ImageElement(
      transform: transform,
      uiImage: uiImage,
      imageFilename: imageFilename)
    elements.append(element)
    save()
  }
  
  mutating func addElement(text: TextElement) {
    elements.append(text)
  }
  
  mutating func addElements(from transfer: [CustomTransfer], at offset: CGSize) {
    for element in transfer {
      if let text = element.text {
        addElement(text: TextElement(text: text))
      } else if let image = element.image {
        addElement(uiImage: image, at: offset)
      }
    }
  }
  
  mutating func remove(_ element: CardElement) {
    if let element = element as? ImageElement {
      UIImage.remove(name: element.imageFilename)
    }
    if let index = element.index(in: elements) {
      elements.remove(at: index)
    }
    save()
  }
  
  mutating func update(_ element: CardElement?, frameIndex: Int) {
    if let element = element as? ImageElement,
       let index = element.index(in: elements) {
      var newElement = element
      newElement.frameIndex = frameIndex
      elements[index] = newElement
    }
  }
  
  func save() {
    do {
      let encoder = JSONEncoder()
      encoder.outputFormatting = .prettyPrinted
      let data = try encoder.encode(self)
      let filename = "\(id).rwcard"
      let url = URL.documentsDirectory.appendingPathComponent(filename)
      try data.write(to: url)
    } catch {
      print(error.localizedDescription)
    }
  }
}

extension Card: Codable {
  enum CodingKeys: CodingKey {
    case id, backgroundColor, imageElements, textElements
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder
      .container(keyedBy: CodingKeys.self)
    let id = try container.decode(String.self, forKey: .id)
    self.id = UUID(uuidString: id) ?? UUID()
    elements += try container
      .decode([ImageElement].self, forKey: .imageElements)
    
    let components = try container.decode([CGFloat].self, forKey: .backgroundColor)
    backgroundColor = Color.color(components: components)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id.uuidString, forKey: .id)
    let imageElements: [ImageElement] = elements.compactMap { $0 as? ImageElement }
    try container.encode(imageElements, forKey: .imageElements)
    let components = backgroundColor.colorComponent()
    try container.encode(components, forKey: .backgroundColor)
  }
}
