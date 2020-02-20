//
//  UIViewControllerExtension.swift
//  Weather
//
//  Created by Gitko on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(message: String?, cancelTitle: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel))
        present(alert, animated: true, completion: nil)
    }
}
