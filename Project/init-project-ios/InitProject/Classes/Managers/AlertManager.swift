//
//  AlertManager.swift
//  Requestum
//
//  Created by Requestum on 25.12.2019.
//  Copyright © 2019 Requestum. All rights reserved.
//

import UIKit

final class AlertManager: NSObject {
    
    static var topViewController: UIViewController? {
        return UIApplication.topViewController()
    }
    
    static func showErrorMessage(with text: String?) {
        
        let alert = UIAlertController(title: R.string.alert.error(), message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: R.string.alert.ok(), style: .default, handler: nil))
        topViewController?.present(alert, animated: true, completion: nil)
    }
    
    static func showMessage(with text: String?, okHandler: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: "", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: R.string.alert.ok(), style: .default) { _ in
            okHandler?()
        })
        topViewController?.present(alert, animated: true, completion: nil)
    }
    
    static func showConformationAlert(with title: String? = nil,
                                      message: String? = nil,
                                      okActionTitle: String = R.string.alert.ok(),
                                      okActionStyle: UIAlertAction.Style = .default,
                                      cancelActionTitle: String = R.string.alert.cancel(),
                                      okHandler: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: title ?? "", message: message ?? "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okActionTitle, style: .default) { _ in
            okHandler?()
        })
        alert.addAction(UIAlertAction(title: cancelActionTitle, style: .cancel, handler: nil))
        topViewController?.present(alert, animated: true, completion: nil)
    }
    
    static func showDeleteConformationAlert(with title: String? = nil, message: String? = nil, deleteHandler: (() -> Void)? = nil) {
        
        showConformationAlert(with: title, message: message, okActionTitle: R.string.alert.delete(), okActionStyle: .destructive, okHandler: deleteHandler)
    }
    
    static func showAlert(withTitle title: String? = nil, message: String? = nil, actions: [UIAlertAction]? = nil, style: UIAlertController.Style = .alert) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        if actions != nil {
            for action in actions! {
                alert.addAction(action)
            }
        } else {
            alert.addAction(UIAlertAction(title: R.string.alert.ok(), style: .default, handler: nil))
        }
        topViewController?.present(alert, animated: true, completion: nil)
    }
}
