import SwiftUI

struct AftGeryonView: View   {
    let textToType = "Hera scattered the cattle and flooded your way home, but after a year of chasing and clever stone-stacking, you reached Eurystheus,only for the herd to be sacrificed to her."
    
    @State private var animatedText: String = ""
    
    @Binding var scene: AppScene
    @Binding var completedGeryon: Bool
    
    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .center) {
                
                Image("Hercules")
                    .resizable()
                
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                 //   .ignoresSafeArea()
                    .brightness(-0.4)
                    .offset(x: -40)
                    .ignoresSafeArea()
                VStack {
                    Text(animatedText)
                    
                        .foregroundStyle(.white)
                        .font(.title)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .padding()
                        .padding()
                        .padding()
                        .padding()
                    
                    Spacer()
                    
                    Button {
                        scene = .startAugean
                        
                    } label: {
                        Text("Continue")
                            .padding()
                            .frame(maxWidth: .infinity)
                    }
                    
                    .background(Color.white)
                    .cornerRadius(15)
                    .foregroundColor(.black)
                    .padding()
                    .padding(.horizontal)
                    .padding(.horizontal)
                    .padding(.horizontal)
                    .padding(.horizontal)
                    .padding(.horizontal)
                    
                }
                .padding()
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

//#Preview {
//    AftGeryonView(endGeryon: .constant(false), startCerberus: .constant(true))
//}

