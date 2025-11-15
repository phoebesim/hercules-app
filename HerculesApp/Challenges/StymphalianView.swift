//
//  StymphalianView.swift
//  HerculesApp
//
//  Created by Phoebe Sim on 14/11/25.
//

import SwiftUI
import AVFoundation

struct StymphalianView: View {
    @State private var text = "shake"
    @State private var audioPlayer:AVAudioPlayer?
    @State private var count = 0
    @State private var vibrate = false
    @State private var birdNumber: Int
    @State private var sitting1 = "StymphalianBirdSitting"
    @State private var sitting2 = "StymphalianBirdSitting"
    @State private var sitting3 = "StymphalianBirdSitting"
    @State private var sitting4 = "StymphalianBirdSitting"
    @State private var sitting5 = "StymphalianBirdSitting"
    @State private var sitting6 = "StymphalianBirdSitting"
    @State private var sitting7 = "StymphalianBirdSitting"
    @State private var sitting8 = "StymphalianBirdSitting"

    
    var body: some View {
        ZStack{
            Image("GrassBranches")
                .resizable()
                .frame(width: 500, height: 1000)
            Image("Krotala")
                .resizable()
                .frame(width: 300, height: 300)
                .rotationEffect(.degrees(130))
                .offset(y: 290)
                .onShake {
                    playSound()
                    vibrate.toggle()
                }
                .sensoryFeedback(.impact(flexibility: .rigid), trigger: vibrate)
            
            Bird(imageID: sitting1, size: 200, positionX: -160, positionY: -70)
            Bird(imageID: sitting2, size: 200, positionX: -90, positionY: -70)
            Bird(imageID: sitting3, size: 200, positionX: -10, positionY: -65)
            Bird(imageID: sitting4, size: 200, positionX: 160, positionY: -220)
            Bird(imageID: sitting5, size: 200, positionX: 95, positionY: -205)
            Bird(imageID: sitting6, size: 200, positionX: 30, positionY: -180)
            Bird(imageID: sitting7, size: 200, positionX: 160, positionY: -220)
            Bird(imageID: sitting8, size: 200, positionX: -160, positionY: -360)
            
        }
        
    }
    
    /*func randomBird() -> Int {
        var birdNumber = Int.random(in: 1...8)
    }*/
    
    func playSound() {
   
        guard let soundURL = Bundle.main.url(forResource: "castanet", withExtension: ".m4a") else {
            print("no sound found")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
            print("works")
        } catch {
            print("can't play this sound")
        }
    }
}

struct Bird: View {
    var imageID: String
    var size: CGFloat
    var positionX: CGFloat
    var positionY: CGFloat
    var body: some View {
        Image(imageID)
            .resizable()
            .frame(width: size, height: size)
            .offset(x:positionX, y:positionY)
    }
}


extension UIDevice {
    static let deviceDidShakeNotification = Notification.Name(rawValue: "deviceDidShakeNotification")
}


extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
    }
}


struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}

extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}




/*#Preview {
    StymphalianView()
}*/
