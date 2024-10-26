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
    var totalPerson: Int = 2
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
    }
    @IBAction func commisionSegmentedControlValueChanged(_ sender: Any) {
        billTextField.resignFirstResponder()
        totalBillLabel.isHidden = true
        let index = Int(commisionSegmentedControl.selectedSegmentIndex)
        switch index {
            case 0:
                commission = 0.05
            case 1:
                commission = 0.10
            case 2:
                commission = 0.15
            case 3:
                commission = 0.20
            case 4:
                commission = 0.25
            default:
                commission = 0.5
        }
        print("\(commission)")
    }
    
    @IBAction func calculateButtonTapped(_ sender: Any) {
        billTextField.resignFirstResponder()
        let bill = Double(billTextField.text!) ?? 0
        totalBill = (bill * commission) + bill
        totalBillLabel.isHidden = false
        totalBillLabel.text = "\(totalBill / Double(totalPerson))"
    }
    
}

