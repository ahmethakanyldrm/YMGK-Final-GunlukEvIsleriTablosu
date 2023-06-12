//
//  ContentView.swift
//  YMGK-Final Gunluk Ev Isi Tablosu
//
//  Created by AHMET HAKAN YILDIRIM on 11.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State var hakanOdaTemizleme: Int = 0
    @State var hakanYatakToplama: Int = 0
    @State var hakanBulasikYikama: Int = 0
    @State var hakanYemekHazirlamaYardim: Int = 0
    @State var nehirOdaTemizleme: Int = 0
    @State var nehirYatakToplama: Int = 0
    @State var nehirBulasikYikama: Int = 0
    @State var nehirYemekHazirlamaYardim: Int = 0
    @State var winner: String = ""
    
     @State var hakanPuan = 0
     @State var nehirPuan = 0
    
    var body: some View {
        VStack {
            VStack {
                Text("GÜNLÜK EV İŞİ TABLOSU").font(.title2).padding(5)
                Divider()
                VStack {
                    Text("Odayı Temizleme - 2 Çıkartma")
                    Text("Yatağı Toplama - 1 Çıkartma")
                    Text("Bulaşıkları Yıkama - 4 Çıkartma")
                    Text("Akşam Yemeği Hazırlama - 3 Çıkartma")
                    Divider()
                }
            }
            
            VStack {
                HStack{
                    VStack{
                        Image("user").resizable().frame(width: 100,height: 100).padding(5)
                        Text("Hakan")
                    }
                    VStack{
                        HStack{
                            Text("OdayıTemizleme:\(hakanOdaTemizleme)")
                            Stepper("", value: $hakanOdaTemizleme, in: 0...10 ,step: 2)
                        }
                        HStack{
                            Text("Yatağı Toplama: \(hakanYatakToplama)")
                            Stepper("", value: $hakanYatakToplama, in: 0...10, step: 1)
                        }
                        HStack{
                            Text("Bulaşıkları Yıkama: \(hakanBulasikYikama)")
                            Stepper("", value: $hakanBulasikYikama, in: 0...16,step: 4)
                        }
                        HStack{
                            Text("Akşam Yemeği Hazırlama: \(hakanYemekHazirlamaYardim)")
                            Stepper("", value: $hakanYemekHazirlamaYardim, in: 0...15,step: 3)
                        }
                        
                    }

                }
                Text("Hakanın Puanı: \(hakanPuan)")
               
            }
            Divider().padding(8)
            VStack {
                HStack{
                    VStack{
                        Image("user").resizable().frame(width: 100,height: 100).padding(5)
                        Text("Nehir")
                    }
       
                    VStack{
                        HStack{
                            Text("Odayı Temizleme: \(nehirOdaTemizleme)")
                            Stepper("", value: $nehirOdaTemizleme, in: 0...10 ,step: 2)
                            
                        }
                        HStack{
                            Text("Yatağı Toplama: \(nehirYatakToplama)")
                            Stepper("", value: $nehirYatakToplama, in: 0...10, step: 1)
                        }
                        HStack{
                            Text("Bulaşıkları Yıkama: \(nehirBulasikYikama)")
                            Stepper("", value: $nehirBulasikYikama, in: 0...16,step: 4)
                        }
                        HStack{
                            Text("Akşam Yemeği Hazırlama: \(nehirYemekHazirlamaYardim)")
                            Stepper("", value: $nehirYemekHazirlamaYardim, in: 0...15,step: 3)
                        }
                    }
                }
                Text("Nehirin Puanı: \(nehirPuan)")
                
                
            }.padding(8)
            
            Divider()
            Spacer()
            Text("Kazanan: \(winner)")
            Spacer()
            Button {
                nehirPuan = puanHesapla(value1: nehirOdaTemizleme, value2: nehirYatakToplama, value3: nehirBulasikYikama, valu4: nehirYemekHazirlamaYardim)
                hakanPuan = puanHesapla(value1: hakanOdaTemizleme, value2: hakanYatakToplama, value3: hakanBulasikYikama, valu4: hakanYemekHazirlamaYardim)
                
               winner = winnerHesapla()
            } label: {
                Text("Görevleri Onayla")
            }

        }
    }
    
    private func puanHesapla(value1: Int, value2: Int, value3: Int, valu4:Int) -> Int {
        var result = value1 + value2 + value3 + valu4
        return result
    }
    
    private func winnerHesapla() -> String{
        if hakanPuan > nehirPuan {
            return "Hakan"
        }else if hakanPuan == nehirPuan {
            return "Hakan ile Nehir Aynı Puan"
        }else {
            return "Nehir"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
