//
//  StymphalianView.swift
//  HerculesApp
//
//  Created by Phoebe Sim on 14/11/25.
//

import SwiftUI
import AVFoundation
import ConfettiSwiftUI

struct StymphalianView: View {
    //Here is the change
    @State private var confettiTrigger: Int = 0

    
    var allBirdsAreFlying: Bool {
        sitting1 == "StymphalianBirdFlying" &&
        sitting2 == "StymphalianBirdFlying" &&
        sitting3 == "StymphalianBirdFlying" &&
        sitting4 == "StymphalianBirdFlying" &&
        sitting5 == "StymphalianBirdFlying" &&
        sitting6 == "StymphalianBirdFlying" &&
        sitting7 == "StymphalianBirdFlying"
    }
    
    
    @State private var text = "shake"
    @State private var audioPlayer:AVAudioPlayer?
    @State private var count = 0
    @State private var vibrate = false
    @State private var sitting1 = "StymphalianBirdSitting"
    @State private var sitting2 = "StymphalianBirdSitting"
    @State private var sitting3 = "StymphalianBirdSitting"
    @State private var sitting4 = "StymphalianBirdSitting"
    @State private var sitting5 = "StymphalianBirdSitting"
    @State private var sitting6 = "StymphalianBirdSitting"
    @State private var sitting7 = "StymphalianBirdSitting"
    @State private var sitting8 = "StymphalianBirdSitting"
    
    @Binding var scene: AppScene
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("GrassBranches")
                    .resizable()
                    .frame(width: 500, height: 1000)
                
                Image("Krotala")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .rotationEffect(.degrees(130))
                    .offset(y: 290)
                
                HStack {
                    Image(systemName: "iphone.gen3.radiowaves.left.and.right")
                        .foregroundStyle(.white)
                    Text("Hold your phone sideways\nand flick it like a handbell!")
                        .foregroundStyle(.white)
                    
                    
                }
                .offset(y:120)
                
                
                .onShake {
                    playSound()
                    vibrate.toggle()
                    flyRandomBird()
                }
                
                .buttonStyle(.borderedProminent)
                .sensoryFeedback(.impact(flexibility: .rigid), trigger: vibrate)
                
                
                
                Bird(imageID: sitting1, positionX: -160, positionY: -70)
                Bird(imageID: sitting2, positionX: -90, positionY: -70)
                Bird(imageID: sitting3, positionX: -10, positionY: -65)
                Bird(imageID: sitting4, positionX: 160, positionY: -220)
                Bird(imageID: sitting5, positionX: 95, positionY: -205)
                Bird(imageID: sitting6, positionX: 30, positionY: -180)
                Bird(imageID: sitting7, positionX: -160, positionY: -360)
                
                if allBirdsAreFlying {
                    
                    Image(.greece)
                        .resizable()
                        //.fill(.ultraThinMaterial)
                        .ignoresSafeArea()
                        .brightness(-0.3)
                    
                    VStack(spacing: 24) {
                       Spacer()
                        Text("You Won")
                            .font(.system(size: 48, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .confettiCannon(trigger: $confettiTrigger, num: 50, confettiSize: 20.0, radius: 800.0)
                                                        
                                        
                                                        .onAppear {
                                                            confettiTrigger += 1 
                                                        }
                        
                        
                       Spacer()
                        
                        Button {
                            scene = .endStymphalian
                        } label: {
                            Text("Continue")
                                .padding()
                                .font(.title2.weight(.semibold))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, minHeight: 56)
                                .padding()
                        }
                        //.background(Color.pink)
                        //.cornerRadius(12)
                        //.padding(.horizontal, 60)
                        //.padding(.bottom, 150)
                        
                        .background(Color.white)
                        .cornerRadius(15)
                        .foregroundColor(.black)
                        .padding(50)
                        
                    }
                    
                    
                }
            }
            .toolbar{
                ToolbarItem {
                    Button{
                        scene = .quest
                    } label: {
                        Image(systemName: "house")
                            .foregroundStyle(.black)
                            .frame(width: 50, height: 50)
                        
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItem (placement: .topBarLeading){
                Button {
                    scene = .startDeer
                } label: {
                    Image(systemName: "house" )
                }
            }
        }
    }
    
    
    
    func flyRandomBird() {
        let randomBird = Int.random(in: 1...7)
        
        if randomBird == 1 {
            sitting1 = "StymphalianBirdFlying"
            
        }
        if randomBird == 2 {
            sitting2 = "StymphalianBirdFlying"
        }
        if randomBird == 3 {
            sitting3 = "StymphalianBirdFlying"
        }
        if randomBird == 4 {
            sitting4 = "StymphalianBirdFlying"
        }
        if randomBird == 5 {
            sitting5 = "StymphalianBirdFlying"
        }
        if randomBird == 6 {
            sitting6 = "StymphalianBirdFlying"
        }
        if randomBird == 7{
            sitting7 = "StymphalianBirdFlying"
        }
        
    }
    
    
    
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
    var positionX: CGFloat
    var positionY: CGFloat
    var body: some View {
        Image(imageID)
            .resizable()
            .frame(width: 200, height: 230)
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




#Preview {
    StymphalianView(scene: .constant(.continueStymphalian))
}
