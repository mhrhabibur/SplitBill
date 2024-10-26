//
//  ViewController.swift
//  Bill Share App
//
//  Created by Habibur Rahman on 10/26/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var commisionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var totalPersonLabel: UILabel!
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var personStepper: UIStepper!
    var totalPerson: Int = 1
    var commission: Double = 0.0
    var totalBill: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.becomeFirstResponder()
        totalPersonLabel.text = "Total Person: \(totalPerson)"
        totalBillLabel.isHidden = true
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
                commission = 0.00
            case 1:
                commission = 0.02
            case 2:
                commission = 0.05
            case 3:
                commission = 0.10
            case 4:
                commission = 0.15
            case 5:
                commission = 0.20
            case 6:
                commission = 0.25
            default:
                commission = 0.00
        }
        print("\(commission)")
        calculateBill()
    }
    
    @IBAction func calculateButtonTapped(_ sender: Any) {
        calculateBill()
    }
    
    private func calculateBill() {
        guard billTextField.hasText else { return }
        billTextField.resignFirstResponder()
        let bill = Double(billTextField.text!) ?? 0
        totalBill = (bill * commission) + bill
        totalBillLabel.isHidden = false
        let billPerPerson = totalBill / Double(totalPerson)
        totalBillLabel.text = "Per Person: $\(String(format: "%.2f", billPerPerson))"
    }
    
}

