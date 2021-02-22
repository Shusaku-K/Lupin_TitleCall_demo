//
//  LupinTitleViewModel.swift
//  Lupin the Third Title Call
//
//  Created by 金城秀作 on 2021/02/23.
//

import Foundation
import UIKit
import AVFoundation

class LupinTitleViewModel: NSObject, ObservableObject {
    @Published var title:String = ""
    @Published var typeWrite:String = ""
    @Published var isTyping:Bool = false
    
    //音楽：魔王魂 - 銃03
    private let titleSound = try! AVAudioPlayer(data: NSDataAsset(name: "se_maoudamashii_battle_gun03")!.data)
    //音楽：魔王魂 - 銃03
    private let typewriter = try! AVAudioPlayer(data: NSDataAsset(name: "se_maoudamashii_battle_gun03")!.data)
    
    func startTitleCall() {
        if title.count == 0 {
            return
        }
        
        titleSound.prepareToPlay()
        typewriter.prepareToPlay()
        
        DispatchQueue.global().async {
            DispatchQueue.main.sync {
                self.isTyping = true
            }
            
            for string in self.title {
                Thread.sleep(forTimeInterval: 0.15)
                self.titleSound.stop()
                self.titleSound.currentTime = 0.0
                self.titleSound.play()
                DispatchQueue.main.sync {
                    self.typeWrite = String(string)
                }
            }
            Thread.sleep(forTimeInterval: 0.15)
            self.titleSound.stop()
            self.typewriter.play()
            DispatchQueue.main.sync {
                self.typeWrite = self.title
            }
            Thread.sleep(forTimeInterval: 2)
            DispatchQueue.main.sync {
                self.isTyping = false
                self.typeWrite = ""
            }
        }
    }
    
}
