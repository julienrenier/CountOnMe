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
    
    //MARK: - Override
    
    override func viewDidLoad() {
        calc.delegate = self
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

extension ViewController: CalcDelegate {
    func showAlert(_ alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }
}
