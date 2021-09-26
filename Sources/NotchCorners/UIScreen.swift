//
//  UIScreen.swift
//  NotchCorners
//
//  Created by p-x9 on 2021/09/27.
//  
//

import UIKit

// swiftlint:disable type_contents_order
extension UIScreen {
    // Notch Bottom Corner Radius
    private static let notchBottomCornerRadiusKey: String = {
        let components = ["Radius", "Corner", "Bottom", "notch"]
        return components.reversed().joined()
    }()

    /// Notch's bottom corner radius
    public var notchBottomCornerRadius: CGFloat {
        guard let className = UIApplication.shared.statusBarProviderClassName,
              let providerClass = NSClassFromString(className) as? NSObject.Type,
              providerClass.responds(to: Selector(UIScreen.notchBottomCornerRadiusKey)),
              let notchBottomCornerRadius = providerClass.value(forKey: UIScreen.notchBottomCornerRadiusKey) as? CGFloat  else {
            return 0
        }

        return notchBottomCornerRadius
    }

    // Notch Top Corner Radius
    private static let notchTopCornerRadiusKey: String = {
        let components = ["Radius", "Corner", "Top", "notch"]
        return components.reversed().joined()
    }()

    /// Notch's top corner radius
    public var notchTopCornerRadius: CGFloat {
        guard let className = UIApplication.shared.statusBarProviderClassName,
              let providerClass = NSClassFromString(className) as? NSObject.Type,
              providerClass.responds(to: Selector(UIScreen.notchTopCornerRadiusKey)),
              let notchTopCornerRadius = providerClass.value(forKey: UIScreen.notchTopCornerRadiusKey) as? CGFloat  else {
            return 0
        }

        return notchTopCornerRadius
    }

    // Notch Size
    private static let notchSizeKey: String = {
        let components = ["Size", "notch"]
        return components.reversed().joined()
    }()

    /// Notch's size
    public var notchSize: CGSize {
        guard let className = UIApplication.shared.statusBarProviderClassName,
              let providerClass = NSClassFromString(className),
              providerClass.responds(to: Selector(UIScreen.notchSizeKey)) else {
            return .zero
        }

        return providerClass.value(forKey: UIScreen.notchSizeKey) as! CGSize
    }

    // Corner Radius
    private static let displayCornerRadiusKey: String = {
        let components = ["Radius", "Corner", "display", "_"]
        return components.reversed().joined()
    }()

    /// Display's corner radius
    public var displayCornerRadius: CGFloat {
        guard let cornerRadius = self.value(forKey: Self.displayCornerRadiusKey) as? CGFloat else {
            return 0
        }

        return cornerRadius
    }
}
// swiftlint:enable type_contents_order
