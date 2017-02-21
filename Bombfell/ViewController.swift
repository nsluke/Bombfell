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
    
    var fibonacciArray:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...25 {
            fibonacciHandler(number: i)
        }
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
        } else if number <= 17 {
            fibonacciNumberToAppend = fibonacciNumberForInteger(number: number)
            fibonacciArray.append(fibonacciNumberToAppend)
            return fibonacciNumberToAppend
        } else if number > 17 {
            fibonacciNumberToAppend = fibonacciNumberForLargerIntegers(number: number)
            fibonacciArray.append(fibonacciNumberToAppend)
            return fibonacciNumberToAppend
        }
        return 0
    }
    
    func fibonacciNumberForLargerIntegers(number:Int) -> Int {
        return (fibonacciArray[number - 2] + fibonacciArray[number - 3])
    }
    
    func fibonacciNumberForInteger(number:Int) -> Int {
        if number <= 2 {
            return 1
        } else {
            return fibonacciNumberForInteger(number: number-2) + fibonacciNumberForInteger(number: number-1)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fibonacciArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:CustomTableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell)!
        
        if (indexPath.row >= fibonacciArray.count) {
            fibonacciHandler(number: indexPath.row + 1)
            tableView.reloadData()
        }

        cell.label?.text = "\(fibonacciHandler(number: indexPath.row))"
        cell.backgroundView?.backgroundColor = UIColor.black
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        tableView.reloadData()
    }
    
}
