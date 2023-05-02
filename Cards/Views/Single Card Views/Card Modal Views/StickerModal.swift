//
//  StickerModal.swift
//  Cards
//
//  Created by Guilherme de Carvalho Correa on 02/05/23.
//

import SwiftUI

struct StickerModal: View {
  @State private var stickerNames: [String] = []
  
  static func loadStickers() -> [String] {
    var themes: [URL] = []
    var stickerNames: [String] = []
    
    let fileManager = FileManager.default
    if let resourcePath = Bundle.main.resourcePath,
       let enumerator = fileManager.enumerator(
        at: URL(fileURLWithPath: resourcePath + "/Stickers"),
       includingPropertiesForKeys: nil,
       options: [
        .skipsSubdirectoryDescendants,
        .skipsHiddenFiles
       ]) {
      for case let url as URL in enumerator
      where url.hasDirectoryPath {
        themes.append(url)
      }
    }
    
    for theme in themes {
      if let files = try?
          fileManager.contentsOfDirectory(atPath: theme.path) {
        for file in files {
          stickerNames.append(theme.path + "/" + file)
        }
      }
    }
    
    return stickerNames
  }
  
  func image(from path: String) -> UIImage {
    print("loading:", path)
    return UIImage(named: path)
    ?? UIImage(named: "error-image")
    ?? UIImage()
  }
  
  var body: some View {
    ScrollView {
      ForEach(stickerNames, id: \.self) { sticker in
        Image(uiImage: image(from: sticker))
          .resizable()
          .aspectRatio(contentMode: .fit)
      }
    }
    .onAppear {
      stickerNames = Self.loadStickers()
    }
  }
}

struct StickerModal_Previews: PreviewProvider {
  static var previews: some View {
    StickerModal()
  }
}