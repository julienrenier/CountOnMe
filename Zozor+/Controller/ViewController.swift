//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    // MARK: - Properties
    let calc = Calc()

    // MARK: - Override

    override func viewDidLoad() {
        calc.delegate = self
    }

    // MARK: - Action

    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (index, numberButton) in numberButtons.enumerated() where numberButton == sender {
            calc.addNewNumber(index)
            updateDisplay()
        }
    }

    @IBAction func plus() {
        addOperator("+")
    }
    
    @IBAction func minus() {
        addOperator("-")
    }

    @IBAction func equal() {
        if let total = calc.calculateTotal() {
            textView.text += "\(total)"
            calc.clear()
        }
    }

    // MARK: - Methods

    fileprivate func updateDisplay() {
        var text = ""
        for (index, stringNumber) in calc.stringNumbers.enumerated() {
            // Add operator
            if index > 0 {
                text += calc.operators[index]
            }
            // Add number
            text += stringNumber
        }
        textView.text = text
    }
    
    fileprivate func addOperator(_ newOperator: String) {
        if calc.canAddOperator {
            calc.operators.append(newOperator)
            calc.stringNumbers.append("")
            updateDisplay()
        }
    }
    
}

extension ViewController: CalcDelegate {
    func showAlert(_ alert: UIAlertController) {
        present(alert, animated: true)
    }
}
