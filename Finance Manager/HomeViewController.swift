//
//  ViewController.swift
//  Finance Manager
//
//  Created by Vaibhav Bafna on 1/19/17.
//  Copyright © 2017 Vaibhav Bafna. All rights reserved.
//

import UIKit

struct Account {
    var transaction: [Transaction]
}

struct Transaction {
    var title: String
    var amount: Float
    let date: Date = Date()
}

var primaryAccount = Account(transaction: [
    Transaction(title: "Mighty Good Coffee", amount: 3.65),
    Transaction(title: "Lab Cafe", amount: 3.81),
    Transaction(title: "Espresso Bar", amount: 5.65)
    ])

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Hello World")
        title = "Finances"
        
        //delegate
        self.tableView.dataSource = self
        self.tableView.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    @IBAction func didTapAddButton(_ sender: UIBarButtonItem) {
        let addTransactionVC = self.storyboard?.instantiateViewController(withIdentifier: "AddTransactionViewController") as! AddTransactionViewController
        self.navigationController?.present(addTransactionVC, animated: true, completion: nil)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return primaryAccount.transaction.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "Cell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: identifier)
        }
        
        let transactionAtIndexPath = primaryAccount.transaction[indexPath.row]
        
        cell?.textLabel?.text = transactionAtIndexPath.title
        
        cell?.detailTextLabel?.text = "$\(transactionAtIndexPath.amount)"
        
        return cell!
        
        
    }
    
}

