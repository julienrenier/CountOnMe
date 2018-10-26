//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    let calc = Calc()

    // MARK: - Outlets

    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    //MARK: - Notification
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(showAlertController), name: Notification.Name(rawValue: "alertController"), object: nil)
    }
    
    @objc
    fileprivate func showAlertController(_ notification: Notification) {
        if let alert = notification.object as? UIAlertController {
            present(alert, animated: true, completion: nil)
        }
    }

    // MARK: - Action

    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                calc.addNewNumber(i)
                updateDisplay()
            }
        }
    }

    @IBAction func plus() {
        if calc.canAddOperator {
        	calc.operators.append("+")
        	calc.stringNumbers.append("")
            updateDisplay()
        }
    }

    @IBAction func minus() {
        if calc.canAddOperator {
            calc.operators.append("-")
            calc.stringNumbers.append("")
            updateDisplay()
        }
    }

    @IBAction func equal() {
        if let total = calc.calculateTotal() {
            textView.text += "\(total)"
            calc.clear()
        }
    }


    // MARK: - Methods

    func updateDisplay() {
        var text = ""
        for (i, stringNumber) in calc.stringNumbers.enumerated() {
            // Add operator
            if i > 0 {
                text += calc.operators[i]
            }
            // Add number
            text += stringNumber
        }
        textView.text = text
    }
}
