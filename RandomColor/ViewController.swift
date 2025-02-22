//
//  ViewController.swift
//  RandomColor
//
//  Created by 권순욱 on 2/22/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var changeColorButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetColor()
    }

    @IBAction func changeColorButton(_ sender: UIButton) {
        view.backgroundColor = randomColor()
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        resetColor()
    }
    
    private func randomColor() -> UIColor {
        let randomRed = CGFloat.random(in: 0...255)
        let randomGreen = CGFloat.random(in: 0...255)
        let randomBlue = CGFloat.random(in: 0...255)
        
        let randomColor = UIColor(r: randomRed, g: randomGreen, b: randomBlue)
        let invertedColor = UIColor(r: 255 - randomRed, g: 255 - randomGreen, b: 255 - randomBlue)
        
        label.text = "R: \(Int(round(randomRed))), G: \(Int(round(randomGreen))), B: \(Int(round(randomBlue)))"
        label.textColor = invertedColor
        changeColorButton.tintColor = invertedColor
        resetButton.tintColor = invertedColor
        
        return randomColor
    }
    
    private func resetColor() {
        view.backgroundColor = .white
        label.text = "R: 255, G: 255, B: 255"
        label.textColor = .black
        changeColorButton.tintColor = .black
        resetButton.tintColor = .black
    }
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
