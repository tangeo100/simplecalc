//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    //Calculates the value from the string array.  Works for negative numbers
    public func calculate(_ args: [String]) -> Int {
        switch args[args.count - 1]{ //check what "mode" the calculator is in
        case "count":
            return args.count - 1 //return the number of values in count
        case "avg":
            var total:Int = 0;
            if args.count == 1{
                return 0
            } else if args.count == 2{
                return Int(args[0])!
            }
            for i in 0...args.count - 2{ //loop through array and add all numbers
                total += Int(args[i])!
            }
            return total/(args.count - 1) //return average
        case "fact":
            var fact:Int = 1;
            if args.count == 1{
                return 0
            }
            for i in 1...Int(args[0])!{ //loop through 1 to the first value of the array
                fact *= i
            }
            print(fact)
            return fact
        default: //if there is none of the previous options, by default calculate expression
            switch args[1]{
            case "+":
                return Int(args[0])! + Int(args[2])!
            case "-":
                return Int(args[0])! - Int(args[2])!
            case "*":
                return Int(args[0])! * Int(args[2])!
            case "/":
                if Int(args[2])! == 0 { //check to prevent devision by 0
                    return 0 //default value <- normally should be nil
                }
                return Int(args[0])! / Int(args[2])!
            case "%":
                if Int(args[2])! == 0 { //check to prevent devision by 0
                    return 0 //default value <- normally should be nill
                }
                return Int(args[0])! % Int(args[2])!
            default:
                return 0
            }
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

