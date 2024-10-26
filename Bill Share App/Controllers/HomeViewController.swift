//
//  ViewController.swift
//  Bill Share App
//
//  Created by Habibur Rahman on 10/26/24.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var commisionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var totalPersonLabel: UILabel!
    @IBOutlet weak var originalBillLabel: UILabel!
    @IBOutlet weak var totalTipsLabel: UILabel!
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var perPersonBillLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var personStepper: UIStepper!
    
    var bill: Double = 0.0
    var totalPerson: Int = 1
    var tipPercentage: Double = 0.0
    var totalTips: Double = 0.0
    var totalBill: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.becomeFirstResponder()
        totalPersonLabel.text = "Total Person: \(totalPerson)"
        totalBillLabel.isHidden = true
        calculateButton.isHidden = true
        billTextField.delegate = self
        navigationItem.title = "Bill Share App"
    }
    
    @IBAction func personStepperValueChanged(_ sender: Any) {
        billTextField.resignFirstResponder()
        totalBillLabel.isHidden = true
        totalPerson = Int(personStepper.value)
        print(totalPerson)
        totalPersonLabel.text = "Total Person: \(totalPerson)"
        calculateBill()
    }
    
    @IBAction func commisionSegmentedControlValueChanged(_ sender: Any) {
        billTextField.resignFirstResponder()
        totalBillLabel.isHidden = true
        let index = Int(commisionSegmentedControl.selectedSegmentIndex)
        switch index {
            case 0:
                tipPercentage = 0.00
            case 1:
                tipPercentage = 0.02
            case 2:
                tipPercentage = 0.05
            case 3:
                tipPercentage = 0.10
            case 4:
                tipPercentage = 0.15
            case 5:
                tipPercentage = 0.20
            case 6:
                tipPercentage = 0.25
            default:
                tipPercentage = 0.00
        }
        print("\(tipPercentage)")
        calculateBill()
    }
    
    @IBAction func calculateButtonTapped(_ sender: Any) {
        calculateBill()
    }
    
    private func calculateBill() {
        guard billTextField.hasText else { return }
        bill = Double(billTextField.text!) ?? 0
        totalTips = (bill * tipPercentage)
        totalBill = totalTips + bill
        totalBillLabel.isHidden = false
        originalBillLabel.text = "Bill: $\(String(format: "%.2f", bill))"
        totalTipsLabel.text = "Tips: $\(String(format: "%.2f", totalTips))"
        totalBillLabel.text = "Total Bill: $\(String(format: "%.2f", totalBill))"
        let billPerPerson = totalBill / Double(totalPerson)
        perPersonBillLabel.text = "Per Person: $\(String(format: "%.2f", billPerPerson))"
    }
    
    @IBAction func billTextFieldChanged(_ sender: UITextField) {
        calculateBill()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        billTextField.becomeFirstResponder()
        return true
    }
}

