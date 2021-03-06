//
//  LibraryHeader.swift
//  TextExtactor
//
//  Created by Oleksandr Lukashevych on 14.02.2021.
//

import Foundation
import UIKit

protocol LibraryHeaderDelegate {
  func sorted(via sort: LibraryHeader.Sort)
}

final class LibraryHeader: UICollectionReusableView {
  
  var delegate: LibraryHeaderDelegate?
  
  enum Sort: String, CaseIterable {
    case recent = "Recent"
    case title = "Title"
    case modified = "Modified"
  }
  
  @IBOutlet weak var sortButton: UIButton! {
    didSet {
      self.sortButton.showsMenuAsPrimaryAction = true
      self.sortButton.menu = _sortMenuItems
    }
  }
  
  private var _sortMenuItems: UIMenu {
    return UIMenu(title: "", options: .displayInline, children: Sort.allCases.map { sort in
      return UIAction(title: sort.rawValue, handler: { _ in
        self.sortButton.setTitle(sort.rawValue, for: .normal)
        self.delegate?.sorted(via: sort)
      })
    })
  }
}
