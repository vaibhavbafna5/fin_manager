//
//  AddTransactionViewController.swift
//  Finance Manager
//
//  Created by Vaibhav Bafna on 1/19/17.
//  Copyright © 2017 Vaibhav Bafna. All rights reserved.
//

import UIKit

class AddTransactionViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeDown))
        swipeGesture.direction = .down
        view.addGestureRecognizer(swipeGesture)
    }
    
    func didSwipeDown(sender: UISwipeGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        titleTextField.becomeFirstResponder()
    }
    
    @IBAction func didTapDoneButton(_ sender: UIButton) {
        
        if let titleText = titleTextField.text, let amountText = amountTextField.text {
            let amount = Float(amountText)!
            let newTransaction = Transaction(title: titleText, amount: amount)
            primaryAccount.transaction.append(newTransaction)
            self.dismiss(animated: true, completion: nil)
        }
        
    }
}
