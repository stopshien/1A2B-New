//
//  ViewController.swift
//  1A2B
//
//  Created by stopshien on 2022/7/14.
//

import UIKit

class ViewController: UIViewController {
 //猜過的數字與結果
    @IBOutlet weak var HistoryTextView: UITextView!
    //當前猜測的數字，尚未送出還可以做更改前，尚未執行ＡＢ判定。
    @IBOutlet var guessLabel: UILabel!
    //設定一個猜測的矩陣以用來顯示以及比對ＡＢ數量
    var guessarray = ["","","",""]
    //需要一個數字來判別當前矩陣的位數，因矩陣第一數為0，下方按下任一數字按鈕時會加一，故數字從-1開始
    var currentValue = -1
    
    
    var a : Int = 0
    var b : Int = 0
    
    
    //被猜的數字
    var beGuessNumber : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
  
        beGuessNumberFunc()
        HistoryTextView.text = ""
        guessLabel.text = ""
        HistoryTextView.textColor = .systemTeal
    }


    
    //0-9的數字按鈕，透過設定相同數字的tag，在按下按鈕後印出Tag中的數字。
    @IBAction func numberButtons(_ sender: UIButton) {
        
        //設定一個變數為轉換成為字串的tag的數字
        let tagNumber = String((sender as AnyObject).tag)
        //矩陣內數字若達到第四次後便不再執行動作
        if currentValue < 3{
            currentValue += 1
            //switch 後為判定tag為何數字
        switch (sender as AnyObject).tag {
        //case後直接由變數判定由tag轉換的數字
        case Int(tagNumber):
            //將矩陣內的位置由按下按鈕的tag數字取代
            guessarray[currentValue] = tagNumber
            // 將四位數字由guessLabel顯示
            guessLabel.text = guessarray[0] + guessarray[1] + guessarray[2] + guessarray[3]
            
         //   sender.isEnabled = false
        default:
           print("0")
        }
            
    }
    }
    
    @IBAction func cacelButton(_ sender: UIButton) {
        
        if currentValue > -1{
//            var deleteNumber : Int
//            deleteNumber = Int(guessarray[currentValue]) ?? 0
//
        guessarray[currentValue] = ""
        currentValue -= 1
        guessLabel.text = guessarray[0] + guessarray[1] + guessarray[2] + guessarray[3]
           
        }
    }
    
    @IBAction func OKButton(_ sender: UIButton) {
        
        if a < 4{
        //執行順序很重要
        checkfunc()
        
        HistoryTextView.text.append(guessLabel.text! + "[\(a)A\(b)B] \n")
        
        currentValue = -1
        guessarray = ["","","",""]
        guessLabel.text = guessarray[0] + guessarray[1] + guessarray[2] + guessarray[3]

        a = 0
        b = 0
    }
        
    
    }
    
    @IBAction func againButton(_ sender: UIButton){
        againButton()
        
        
    }

    
    //產生隨機不重複四個數字要被猜的函數
    func beGuessNumberFunc(){
        //單純重複四次以下動作，產生四個隨機數字
        for _ in 0...3{
        var randomNumber = Int.random(in: 0...9)
            while beGuessNumber.contains(String(randomNumber)){
            randomNumber = Int.random(in: 0...9)
        }
        beGuessNumber.append(String(randomNumber))
    }
        print(beGuessNumber)
    }
    
    //確認檢查結果的函式，算出有幾A幾B
    func checkfunc(){
        
        for i in 0...3{
            if guessarray[i] == beGuessNumber[i]{
                a += 1
            }else if beGuessNumber.contains(guessarray[i]){
                b += 1
            }
        }
    }
    
    
    
    func againButton(){
        a = 0
        b = 0
        currentValue = -1
        guessarray = ["","","",""]
        HistoryTextView.text = ""
        guessLabel.text = ""
        
    }
}

