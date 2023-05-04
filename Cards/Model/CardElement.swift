//
//  CardElement.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 01/05/23.
//

import SwiftUI

protocol CardElement {
  var id: UUID { get }
  var transform: Transform { get set }
}

extension CardElement {
  func index(in array: [CardElement]) -> Int? {
    array.firstIndex { $0.id == id }
  }
}

struct ImageElement: CardElement {
  let id = UUID()
  var transform = Transform()
  var uiImage: UIImage?
  var frameIndex: Int?
  var imageFilename: String?
  
  var image: Image {
    Image(
      uiImage: uiImage ??
      UIImage(named: "error-image") ??
      UIImage())
  }
}

extension ImageElement: Codable {
  enum CodingKeys: CodingKey {
    case transform, imageFilename, frameIndex
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder
      .container(keyedBy: CodingKeys.self)
    transform = try container
      .decode(Transform.self, forKey: .transform)
    frameIndex = try container
      .decodeIfPresent(Int.self, forKey: .frameIndex)
    imageFilename = try container
      .decodeIfPresent(String.self, forKey: .imageFilename)
    if let imageFilename {
      uiImage = UIImage.load(uuidString: imageFilename)
    } else {
      uiImage = UIImage.errorImage
    }
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(transform, forKey: .transform)
    try container.encode(frameIndex, forKey: .frameIndex)
    try container.encode(imageFilename, forKey: .imageFilename)
  }
}

struct TextElement: CardElement {
  let id = UUID()
  var transform = Transform()
  var text = ""
  var textColor = Color.black
  var textFont = "Gill Sans"
}
