import SwiftUI

struct BeforeLionView: View {
    let textToType = "Your first labour: to kill the Nemean lion. If you kill the lion in 30 days, it will be sacrificed to your father, Zeus. If not, a boy will be sacrificed to Zeus."
    
    @State private var animatedText: String = ""
    @State private var goNext = false   // controls navigation
    
    var body: some View {
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
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .padding(50)
            }
            .onAppear { animateText() }
            
            Button("Continue") {
                goNext = true
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .offset(x: 0, y: 300)
            .foregroundColor(.black)
        }
        .padding()
        .navigationDestination(isPresented: $goNext) {
            LionView()
        }
    }
    
    func animateText() {
        for (index, character) in textToType.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.05) {
                animatedText.append(character)
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
        }
    }
}

#Preview {
    BeforeLionView()
}
