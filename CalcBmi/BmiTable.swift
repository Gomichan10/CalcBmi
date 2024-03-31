//
//  BmiTable.swift
//  CalcBmi
//
//  Created by Gomi Kouki on 2023/07/18.
//

import Foundation
import RealmSwift

class BmiTable: Object{
    @Persisted var BMI = 0.0
    @Persisted var date = ""
    @Persisted var type = ""
}
