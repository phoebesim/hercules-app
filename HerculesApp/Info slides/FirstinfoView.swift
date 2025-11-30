import SwiftUI

struct FirstinfoView: View   {
    let textToType = "You have incurred Hera’s wrath... because you exist. You are a result of Zeus’ infidelity. Hera tried to stop your birth. Hera tried to kill you as a baby. Hera turned you into a murderer. Hera made you a slave for your cousin and king Eurystheus. Now, you must perform 10 labours for him. You are Hercules."
    
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
                       
                    
                    Spacer()
                    
                    Button {
                        scene = .quest
                        
                    } label: {
                        Text("Continue")
                            .padding()
                            .frame(maxWidth: .infinity)
                    }
                    
                    
                    .background(Color.white)
                    .cornerRadius(15)
                    .foregroundColor(.black)
                    
                    
                }
                .padding(30)
                .onAppear {
                    animateText()
                }
                
                
            }
            
            
            
            
        }
        .navigationBarBackButtonHidden(true)
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
    FirstinfoView(scene: .constant(.firstInfo))
}

