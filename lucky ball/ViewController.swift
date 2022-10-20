//
//  ViewController.swift
//  lucky ball
//
//  Created by Mac on 7/19/1401 AP.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var luckyLabel: UILabel!
    @IBOutlet weak var wheelBtn: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    
    let randomColors = [UIColor.orange, UIColor.blue, UIColor.black, UIColor.white, UIColor.green, UIColor.gray, UIColor.red, UIColor.yellow]
    
    let randomLuckyTexts = ["هیچ اشکالی نداره", "باز بهتر از سفره ","نا امید نباش","ادامه بده","داری نزدیک میشی","بابا ماشالا","فقط یدونهههه","تبریککککک"]
    
    func  getRandomNumber(index:Int ) -> Int {
        let randomNumber = Int.random(in: 0...7)
        
        self.wheelBtn.setBtnTitle(title: "\(self.getPersianNumber(number: randomNumber))")
        
        return randomNumber
    }
    
    func getPersianNumber(number: Int) -> String {
        switch number {
        
        case 0:
            return "۰"
        case 1:
            return "۱"
        case 2:
            return "۲"
        case 3:
            return"۳"
        case 4:
            return"۴"
        case 5:
            return "۵"
        case 6:
            return "۶"
        case 7:
            return"۷"
        default:
            return "۰"
        }
    }
    
    func roundwheel() {
        var randomLuckyNumber: Int!
        DispatchQueue.global(qos: .background).async {
            for i in 0...7{
                DispatchQueue.main.async{
                    randomLuckyNumber = self.getRandomNumber(index: i)
                    self.wheelBtn.backgroundColor = self.randomColors[i]
                    print(i)
                    if (i == 7) {
                        self.wheelBtn.isEnabled = true
                        self.numberLabel.text = self.getPersianNumber(number: randomLuckyNumber!)
                        self.luckyLabel.text = self.randomLuckyTexts[Int(randomLuckyNumber!)]
                        self.wheelBtn.setBtnTitle(title:"دوباره تلاش کن" )
                        self.wheelBtn.backgroundColor = UIColor.blue
                    } else {
                        self.wheelBtn.isEnabled = false
                        self.luckyLabel.text = ""
                    }
                }
                usleep(useconds_t(20000))
                
            }
            
            
            
            
        }
    }
    
    func setupView()  {
        
        self.numberLabel.text = "۰"
        self.luckyLabel.text = "سلام به همگی"
        self.wheelBtn.makeRAdius(radius: 10)
        self.setHello()
        
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    @IBAction func wheelBtnPressed(_ sender: Any) {
        self.getRandomNumber(index: 0)
        self.roundwheel()
        
        
    }
}
extension ViewController {
    func  setHello() {
        self.wheelBtn.setBtnTitle(title: "hello")
    }
        
    
    
    
}
    
    extension UIButton {
        
        func makeRAdius(radius: CGFloat)  {
            assert(radius > 0 , "invalid radius number")
            
            self.layer.cornerRadius = radius
        }
        func setBtnTitle(title: String)  {
            self.setTitle(title, for: .normal)
        }
    }

