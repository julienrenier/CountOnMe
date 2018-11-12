//
//  Calc.swift
//  CountOnMe
//
//  Created by Julien Renier on 26/10/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import UIKit

protocol CalcDelegate: AnyObject {
    func showAlert(_ alert: UIAlertController)
}

class Calc {
    weak var delegate: CalcDelegate?

    var stringNumbers: [String] = [String()]
    var operators: [String] = ["+"]
    var index = 0

    var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if stringNumbers.count == 1 {
                    showAlertController(message: "Démarrez un nouveau calcul !", button: "Ok")
                } else {
                    showAlertController(message: "Entrez une expression correcte !", button: "Ok")
                }
                return false
            }
        }
        return true
    }

    var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                showAlertController(message: "Expression incorrecte !", button: "Ok")
                return false
            }
        }
        return true
    }

    private func showAlertController(message: String, button: String) {
        let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !",
                                        preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        delegate?.showAlert(alertVC)
    }

    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
    }

    func calculateTotal() -> String? {
        if !isExpressionCorrect {
            return nil
        }

        var total = 0
        for (index, stringNumber) in stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
                if operators[index] == "+" {
                    total += number
                } else if operators[index] == "-" {
                    total -= number
                }
            }
        }

        return ("=\(total)")
    }

    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
        index = 0
    }
}
