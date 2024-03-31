//
//  RecordViewController.swift
//  CalcBmi
//
//  Created by Gomi Kouki on 2023/07/20.
//

import UIKit
import RealmSwift

class RecordViewController: UIViewController,UITableViewDataSource {
    
    
    @IBOutlet weak var TableView: UITableView!
    
    let realm = try! Realm()
    var color = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.isEditing = true

        
        TableView.reloadData()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            TableView.reloadData()
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let UserDete = realm.objects(BmiTable.self)
        return UserDete.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = TableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let UserDete = realm.objects(BmiTable.self)
        cell.textLabel?.text = "BMI:\(UserDete[indexPath.row].BMI)(\(UserDete[indexPath.row].type))"
        cell.textLabel?.backgroundColor = UIColor(named: color)
        cell.detailTextLabel?.text = UserDete[indexPath.row].date
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                let userDete = realm.objects(BmiTable.self)
                // データソースから該当のセルのデータを削除
                if indexPath.row < userDete.count {
                    do {
                        try realm.write {
                            realm.delete(userDete[indexPath.row])
                        }
                    } catch {
                        print("Error deleting BmiTable: \(error)")
                    }
                    // テーブルビューからセルを削除
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
            }
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
