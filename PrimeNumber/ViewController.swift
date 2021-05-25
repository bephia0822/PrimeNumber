//
//  ViewController.swift
//  PrimeNumber
//
//  Created by Sophia Wang on 2021/3/7.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        //讓手機頁面的狀態列為白色
        return.lightContent
    }
    
    @IBAction func doThePrimeTest(_ sender: UIButton) {
        //1. Take out the number string from the inputTextField
        if let inputText = inputTextField.text, let inputNumber = Int(inputText){
            //2. Convert the number string to Int
                //把字串透過Int處理變成整數，會得到optional Int,所以要用optional binding
                //3. Using the checkPrime function to get result
                //4.Using the resultLabel to show result
                //呼叫最下面的函式checkPrime會回傳字串，讓resultLabel等於checkPrime
                checkPrime(withNumber: inputNumber){
                    self.resultLabel.text = $0        //Swift語法規定Closure要加入self
                    self.resultLabel.isHidden = false     //剛剛隱藏的文字標籤顯示出來
                }
        }
        inputTextField.text = ""        //按過一次按鈕後會清空TextField
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //畫面一打開就推出鍵盤
        inputTextField.becomeFirstResponder()
    }

    func checkPrime (withNumber testNumber: Int) -> String{
        var isPrime: Bool? = true
        
        if testNumber <= 0{
            isPrime = nil
        }else if testNumber == 1{
            isPrime = false
        }else {
            for i in 2..<testNumber{
                if testNumber % i == 0{
                    //test number is not prime
                    isPrime = false
                    break      //一發現可以被比自己小的數字整除就跳出迴圈，這樣不會跑太久浪費時間
                }
            }
        }
        if isPrime == true{
            return("\(testNumber) is prime")
        }else if isPrime == false{
            return("\(testNumber) is not prime")
        }else{
            return("Please enter a number greater than 0")
        }
    }
    
    func checkPrime(withNumber number:Int, andCompletionHanderler handler:(String)->()) {
        handler(checkPrime(withNumber: number))      //這整串是字串
    }
    
}

