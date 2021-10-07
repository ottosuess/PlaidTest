//
//  ViewController.swift
//  PlaidTest
//
//  Created by 0 on 07.10.21.
//

import UIKit
import LinkKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    private var linkHandler: Handler?

    @IBAction private func presentPlaid() {
        guard let linkToken = textField.text else { return }

        let configuration = LinkTokenConfiguration(token: linkToken) { _ in }
        
        let result = Plaid.create(configuration)
        switch result {
        case .failure(let error):
            print(error)
        case .success(let handler):
            handler.open(presentUsing: .viewController(self))
            linkHandler = handler
        }
    }
}

