//
//  ViewController.swift
//  CalcBmi
//
//  Created by Gomi Kouki on 2023/07/15.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var CmText: UITextField!
    @IBOutlet weak var KgText: UITextField!
    var BMI = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! ResultViewController
        nextVC.BMI = BMI
    }
    
    func CalcBmi(CM:Double,KG:Double) -> Double{
        
        let h = CM / 100
        let w = KG
        var result = w / h / h
        result = floor(result * 10) / 10
        return result
        
    }
    @IBAction func CalcButton(_ sender: Any) {
        let CM = Double(CmText.text!)
        let KG = Double(KgText.text!)
        BMI = CalcBmi(CM: CM!, KG: KG!)
    }
    

}

