import SwiftUI

struct BeforeLionView: View {
    let textToType = "Your first labour: to kill the Nemean lion. If you kill the lion in 30 days, it will be sacrificed to your father, Zeus. If not, a boy will be sacrificed to Zeus."
    
    @State private var animatedText: String = ""
    @State private var goNext = false   // controls navigation
    
    var body: some View {
        NavigationStack{
            ZStack {
                Image("Hercules")
                    .resizable()
                    .frame(width: 500, height: 900)
                    .ignoresSafeArea()
                    .brightness(-0.4)
                    .aspectRatio(contentMode: .fill)
                
                VStack {
                    Text(animatedText)
                        .padding()
                        .foregroundStyle(.white)
                        .font(.title)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity)
                        .padding(50)
                }
                .onAppear { animateText() }
                
                NavigationLink{
                    LionView()
                } label: {
                    Text("Continue")
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .offset(x: 0, y: 300)
                .foregroundColor(.black)
            }
            
            .padding()
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
    BeforeLionView()
}
