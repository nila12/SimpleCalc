//
//  main.swift
//  SimpleCalc
//
//  Created by Mathi Manavalan on 4/4/17.
//  Copyright © 2017 Mathi Manavalan. All rights reserved.
//

/*
 user can enter a number, hit return
 user can enter an operation (+, -, *, /, %), then return
 user can enter a number, hit return
 program calculates the result
 
 can also enter series of numbers separated by spaces and followed
 by either count or avg
 
 can also enter a single number followed by a space and the word fact
 to receive the factorial of that number
 */

// EXTRA CREDIT
// once inside folder containing main.swift, run following commands to execute in terminal
// swiftc ./main.swift
// ./main

// EXTRA CREDIT
// can support negative and decimal values

import Foundation

print("Please enter what you would like to calculate, or exit to quit program")

while true {
    
    var response = readLine(strippingNewline: true)!
    
    var responseArr = response.components(separatedBy: " ")
    
    var numArr = response.components(separatedBy: " ").flatMap{ Double($0)}
    
    if (responseArr.count > 1) { //listed nums
        
        switch responseArr[responseArr.count - 1] {
        case "count" :
            
            print ("Result: \(numArr.count)")
        case "avg" :
            
            var sum = numArr.reduce(0, +)
            
            print ("Result: \(sum / Double(numArr.count))")
            
        case "fact" :
            if numArr.count > 1 {
                print("mismatching values and function")
            } else {
                var sum = 1
                for index in 2...Int(numArr[0]) {
                    sum *= index
                }
                
                print ("Result: \(sum)")
            }
            
        default :
            print ("invalid function")
        }
        
    } else {
        
        if response == "exit" {
            break;
        }
        
        var first = Double.init(response)!
        var oper = readLine(strippingNewline: true)!
        var sec = Double(readLine(strippingNewline: true)!)!
        
        switch oper {
        case "+" :
            print("Result: \(first + sec)")
        case "-" :
            print("Result: \(first - sec)")
        case "/" :
            print("Result: \(first / sec)")
        case "*" :
            print("Result: \(first * sec)")
        case "%" :
            print("Result: \(first.truncatingRemainder(dividingBy: sec))")
        default :
            print ("invalid operator submitted")
            
        }
    }
}
