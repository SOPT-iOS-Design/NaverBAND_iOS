//
//  UIColor.swift
//  NaverBand
//
//  Created by 박주연 on 2020/05/24.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

  @nonobjc class var white: UIColor {
    return UIColor(white: 245.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var naver: UIColor {
    return UIColor(red: 25.0 / 255.0, green: 206.0 / 255.0, blue: 97.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var maintext: UIColor {
    return UIColor(white: 49.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var subtext: UIColor {
    return UIColor(white: 162.0 / 255.0, alpha: 1.0)
  }

}
