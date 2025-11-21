import SwiftUI
import Combine

struct LionView: View {
    @State private var yOffset: CGFloat = 0
    @State private var success: Bool = false
    @State private var hasWon: Bool = false
    @State private var buttonPressed: Bool = false

    var body: some View {
        ZStack {
            Image("Grass")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .brightness(-0.2)

            VStack {
                Text("Shoot the Nemean Lion!")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                    .padding(.top, 40)
                ZStack {
                    
                    Image("Lion")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                    
                    if success == true {
                        Image("Pencil")
                            .resizable()
                            .frame(width: 80, height: 200)
                            .offset(x: 90, y:100 )
                        
                    }
                }

                Spacer()

                HStack(alignment: .center, spacing: 40) {

                    // ------- LEFT SIDE: ZONES + MOVING ARROW -------
                    ZStack(alignment: .top) {
                        VStack(spacing: 0) {
                            zone(color: .green, label: "GREEN")
                            zone(color: .yellow, label: "YELLOW")
                            zone(color: .red, label: "RED")
                        }
                        .frame(width: 80, height: 300)

                        Image(systemName: "arrowshape.left.fill")
                            .foregroundColor(.white)
                            .offset(y: yOffset)
                            .padding(.leading, 100)
                    }
                    
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {yOffset = 300
                        }
                    }
                    
      

                    // ------- RIGHT SIDE: BOW + SHOOT BUTTON -------
                    VStack(spacing: 20) {
                        ZStack {
                            Image("Bow")
                                .resizable()
                                .frame(width: 250, height: 150)
                            
                           

                            if success == false {
                                Image("Pencil")
                                    .resizable()
                                    .frame(width: 80, height: 200)
                            }
                        }

                        Button {
                            buttonPressed = true
                            
                            if yOffset > -109 && yOffset < 301 {
                                success = true
                            } else {
                                success = false
                            }
                        } label: {
                            ZStack {
                                Circle()
                                    .foregroundStyle(.white)
                                    Text("Shoot!")
                                    .font(.title2)
                                    .bold()
                                    .padding()
                                    .background(.white)
                                    .foregroundColor(.black)
        
                                    .frame(width: 150, height: 150)
                            }
                        }
                    }
                }
                .padding(.bottom, 50)
            }

            if hasWon {
                WinView()
            }
        }
    }

    // MARK: - Zone helper
    func zone(color: Color, label: String) -> some View {
        ZStack {
            Rectangle()
                .fill(color)
            Text(label)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(color == .yellow ? .black : .white)
        }
    }
}

#Preview {
    LionView()
}
