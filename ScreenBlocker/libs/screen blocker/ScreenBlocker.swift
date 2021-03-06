//
//  ScreenBlocker.swift
//  ScreenBlocker
//
//  Created by Chris Allinson on 2018-10-03.
//  Copyright © 2018 Chris Allinson. All rights reserved.
//

import Foundation
import UIKit


public protocol ScreenBlockerInput {
    func show(bgColor: UIColor?)
    func hide()
}


// MARK: -

public class ScreenBlocker {

    // MARK: singleton instance variables

    public static let shared = ScreenBlocker()

    private var overlay: ScreenBlockerViewController?
}


// MARK: -

extension ScreenBlocker: ScreenBlockerInput {
    
    // MARK: ScreenBlockerInput
    
    public func show(bgColor: UIColor? = .black) {
        overlay = ScreenBlockerViewController()
        guard let tempOverlay = overlay else {
            return
        }
        
        UIApplication.shared.keyWindow?.rootViewController?.view.addSubview(tempOverlay.view)
        UIApplication.shared.keyWindow?.rootViewController?.addChildViewController(tempOverlay)
        tempOverlay.show(bgColor: bgColor)
    }

    public func hide() {
        guard let tempOverlay = overlay else {
            return
        }
        
        tempOverlay.hide() {
            tempOverlay.removeFromParentViewController()
            tempOverlay.view.removeFromSuperview()
            self.overlay = nil
        }
    }
}
