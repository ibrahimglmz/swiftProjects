//
//  main.swift
//  IleriSeviyeSwiftDersleri01
//
//  Created by İbrahim Gülmez on 16.08.2023.
//

import Foundation


let ibrahimclass = UserClass(isim: "ibrahim", yas: 20, meslek: "studenti")


var ibrahimStruct = UserStruct(isim: "ibrahim", yas: 20, meslek: "students")


ibrahimclass.yas = 33
print(ibrahimclass.yas)




ibrahimStruct.yas = 33
print(ibrahimStruct.yas)


let ibrahimClassCopy = ibrahimclass
var ibrahimStructCopy = ibrahimStruct
print(ibrahimClassCopy.yas)
print(ibrahimStructCopy.yas)

ibrahimStructCopy.yas = 34
ibrahimClassCopy.yas = 34
print(ibrahimClassCopy.yas)
print(ibrahimStructCopy.yas)

print(ibrahimclass.yas)
print(ibrahimStruct.yas)



var benimTuple = (10,20)
print(benimTuple.1)


let benimtuple2 = ("ibrahim",[1,2,3,4])
print(benimtuple2.1[2])


let numaraStringi = "5"
func inteCevirenIf(string: String) -> Int {
    if let benimInregerim = Int(string) {
        return benimInregerim
         
    } else {
        return 0
    }
    
}
print(inteCevirenIf(string: numaraStringi))



func inteCevirenGuardLet(string:String) -> Int {
    guard let benimIntegerim = Int(string) else {
        return 0
        
    }
    return benimIntegerim

}
 


let gunSayısı = 2

var  gunStringi = ""

/*/
if gunSayısı == 1 {
    gunStringi = "Pazartesi"
} else if  gunSayısı == 2 {
    gunStringi = "Salı"
} else if gunSayısı == 3 {
    gunStringi = "Carşamba"
} else if gunSayısı == 4 {
    gunStringi = "Perşembe"
} else if gunSayısı ==  5 {
    gunStringi = "Cuma"
} else if gunSayısı == 6 {
    gunStringi = "Cumartesi"
} else { gunStringi = "Pazar"
}
*/



switch gunSayısı  {
case 1:
    gunStringi = "Pazartesi"
case 2:
    gunStringi = "salı"
case 3:
    gunStringi = "carşamba"
default:
    gunStringi = "pazar"
    
}

print(gunStringi)

var sayi = 5
print(sayi)


sayi =  sayi + 1
print(sayi)
