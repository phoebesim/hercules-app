import SwiftUI

struct AftGeryonView: View   {
    let textToType = "Hera scattered the cattle and flooded your way home, but after a year of chasing and clever stone-stacking, you reached Eurystheus,only for the herd to be sacrificed to her."
    
    @State private var animatedText: String = ""
    
    @Binding var scene: AppScene
    
    var body: some View {
        
        NavigationStack {
            ZStack (alignment: .leading){
                Image("Hercules")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .brightness(-0.4)
                    .offset(x: -20)
                Text(animatedText)
                    .padding()
                    .foregroundStyle(.white)
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity)
                    .padding(50)
                
                    .onAppear {
                        animateText()
                        
                    }
                
                Button {
                    scene = .startCerberus
                    
                } label: {
                    Text("Continue")
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .offset(x: 0, y: 300)
                .foregroundColor(.black)
                .offset(x: 180)
                
                
                
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

