//
//  FirstinfoView.swift
//  HerculesApp
//
//  Created by T Krobot on 10/11/25.
//

import SwiftUI

struct EndView: View   {
    let textToType = "After 12 long years, you finally finished your 12 labours. You joined your a fellow hero, Jason, and his crew, the Argonauts, in their quest for the Golden Fleece, guarded by a sleepless dragon, so Jason could usurp his rightful throne from his uncle. And so your life of heroism continued, going on all sorts of quests and living a life of risks. When you died, Zeus turned you into a minor god, and you married the goddess of youth, Hebe. As for you, your journey playing Hercules, son of Zeus, god of strength, athletes and heroes ends here."
    
    @State private var animatedText: String = ""
    @Binding var scene: AppScene

    
    
    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .center) {
                
                Image("Hercules")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .brightness(-0.4)
                    .offset(x: -20)
                
                VStack {
                    Text(animatedText)
                      
                        .foregroundStyle(.white)
                        .font(.title)
                        .multilineTextAlignment(.leading)
                        .padding(50)
                    
                    Spacer()
                    
                    Button {
                        scene = .quest
                        
                    } label: {
                        Text("Finish")
                            .padding()
                            .frame(maxWidth: .infinity)
                    }
                    
                    .background(Color.white)
                    .cornerRadius(15)
                    .foregroundColor(.black)
                    .padding(50)
                    
                }
                .padding()
                .onAppear {
                    animateText()
                }
                
                
            }
            
        }
        .navigationBarBackButtonHidden()
    }
    
    func animateText() {
        for (index, character) in textToType.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.05) {
                animatedText.append(character)
                
               
            }
        }
    }
}

#Preview {
    EndView(scene: .constant(.lastInfo))
}
