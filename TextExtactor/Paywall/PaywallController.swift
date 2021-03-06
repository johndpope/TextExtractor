//
//  PaywallController.swift
//  TextExtactor
//
//  Created by Oleksandr Lukashevych on 23.02.2021.
//

import Foundation
import UIKit

final class PaywallController: UIViewController {
    
  enum PurhcaseState {
    case successfully
    case denied
  }
  
  var viewModel: PaywallViewModel!
  
  @IBAction func close() {
    self.dismiss(.denied)
  }
  
  @IBAction func subscribePressed() {
    self.dismiss(.successfully)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    SubscriptionHelper.retrieveInfo {
      print("FUC")
    }
  }
  
  func dismiss(_ state: PurhcaseState) {
    switch state {
    case .successfully:
      self.dismiss(animated: true) {
        self.viewModel.successHandler?()
      }
    case .denied:
      self.dismiss(animated: true, completion: nil)
    }
  }
}
