//
//  UIImageExtensions.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 02/05/23.
//

import SwiftUI

extension UIImage: Transferable {
  public static var transferRepresentation: some TransferRepresentation {
    DataRepresentation(importedContentType: .image) { image in
      UIImage(data: image) ?? errorImage
    }
  }
  
  public static var errorImage: UIImage {
    UIImage(named: "error-image") ?? UIImage()
  }
}
