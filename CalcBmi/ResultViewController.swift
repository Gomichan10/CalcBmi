//
//  ResultViewController.swift
//  CalcBmi
//
//  Created by Gomi Kouki on 2023/07/15.
//

import UIKit
import RealmSwift

class ResultViewController: UIViewController {
    
    var BMI = 0.0
    var type = ""
    let realm = try! Realm()
    
    
    @IBOutlet weak var ResultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        typeCase()
        ResultLabel.text = "あなたのBMIは\(BMI)(\(type))です"
        
        
    }
    
    
    func typeCase(){
        
        switch BMI{
        case (0.0...18.4):
            type = "痩せ体型"
        case (18.5...24.9):
            type = "標準体型"
        case (25.0...29.9):
            type = "肥満体型"
        case (30.0...100.0):
            type = "高度肥満体型"
        default:
            break
        }
        
    }
    
    
    
    
    
    
    @IBAction func BackButton(_ sender: Any) {
        
        let BMITable = BmiTable()
        let dt = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        
        let dateString = dateFormatter.string(from: dt)
        
        
        BMITable.BMI = BMI
        BMITable.date = dateString
        BMITable.type = type
        
        try! realm.write{
            realm.add(BMITable)
        }
        
        
        
        
        self.view.window?.rootViewController?.dismiss(animated: true,completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
