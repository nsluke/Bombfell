//
//  ViewController.swift
//  Bombfell
//
//  Created by Luke Solomon on 2/16/17.
//  Copyright © 2017 Luke Solomon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var cellsToDisplay = 100
    var fibonacciArray:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fibonacciHandler(number:Int) -> Int {
        
        var fibonacciNumberToAppend:Int!
        
        if number <= 2 {
            fibonacciNumberToAppend = 1
            fibonacciArray.append(fibonacciNumberToAppend)
            return fibonacciNumberToAppend
        } else if number > 2 {
            fibonacciNumberToAppend = fibonacciNumberForLargerIntegers(number: number)
            fibonacciArray.append(fibonacciNumberToAppend)
            return fibonacciNumberToAppend
        }
        return 0
    }
    
    func fibonacciNumberForLargerIntegers(number:Int) -> Int {
        let firstNumber:Int = fibonacciArray[number - 1]
        let secondNumber:Int = fibonacciArray[number - 2]
        let returnValue:Int = firstNumber + secondNumber
        
        return (returnValue)
    }
    
    func fibonacciNumberForInteger(number:Int) -> Int {
        if number <= 2 {
            return 1
        } else {
            return fibonacciNumberForInteger(number: number-2) + fibonacciNumberForInteger(number: number-1)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsToDisplay
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:CustomTableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell)!

        cell.label?.text = "\(fibonacciHandler(number: indexPath.row))"
        cell.backgroundView?.backgroundColor = UIColor.black
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Emulate pagination since iOS table views don't have an option for first class infinite scrolling
        if indexPath.row == cellsToDisplay - 2 {
            cellsToDisplay += 100
            tableView.reloadData()
        }
    }

}
