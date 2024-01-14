//
//  Musician.swift
//  MusicianClass
//
//  Created by İbrahim Gülmez on 24.07.2023.
//

import Foundation
class  musician {
    var name  : String
    var age : Int
    var instrument : String
    
    
    init(nameInit:String, ageInt:Int, instrumentInit:String){
        name = nameInit
        age = ageInt
        instrument = instrumentInit
    }
    func sig(){
        print("nothing")
    }
}
