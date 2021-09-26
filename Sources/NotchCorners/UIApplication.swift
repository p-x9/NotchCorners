//
//  UIApplication.swift
//  NotchCorners
//
//  Created by p-x9 on 2021/09/27.
//  
//

import UIKit

extension UIApplication {
    var statusBarProviderClassName: String? {
        let window = self.windows.first {
            $0.isKeyWindow
        }
        guard let keyWindow = window,
              let windowScene = keyWindow.windowScene,
              let statusBarManager = windowScene.statusBarManager else {
            return nil
        }

        // Get _UIStatusBarLocalView
        guard statusBarManager.responds(to: Selector(("createLocalStatusBar"))),
              let statusBarLocalView = statusBarManager.perform(Selector(("createLocalStatusBar"))).takeUnretainedValue() as? UIView else {
            return nil
        }
        // Get UIStatusBar
        guard statusBarLocalView.responds(to: Selector(("statusBar"))),
              let statusBar = statusBarLocalView.perform(Selector(("statusBar"))).takeUnretainedValue() as? UIView else {
            return nil
        }
        // Get _UIStatusBar
        guard statusBar.responds(to: Selector(("statusBar"))),
              let _statusBar = statusBar.perform(Selector(("statusBar"))).takeUnretainedValue() as? UIView else {
            return nil
        }

        // Get _UIStatusVisualProvider_iOS
        if _statusBar.responds(to: Selector(("_visualProviderClassName"))) {
            return _statusBar.value(forKey: "_visualProviderClassName") as? String
        }
        return nil
    }
}
