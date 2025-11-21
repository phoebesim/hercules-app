import SwiftUI
import Combine

struct LionView: View {
    @Environment(\.dismiss) var dismiss

    @State private var yOffset: CGFloat = 0
    @State private var success: Bool = false
    @State private var hasWon: Bool = false
    @State private var hasLost: Bool = false
    @State private var buttonPressed: Bool = false
    @State private var goNext: Bool = false

    @State var weaponImage: UIImage?
    @State var showButton = true
    @State private var weaponSheet = false

    var body: some View {
        ZStack {
            Image("Grass")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Text("Shoot the Nemean Lion!")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                    .padding(.top, 40)

                Image("Lion")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)

                Spacer()

                HStack(alignment: .center, spacing: 40) {

                    ZStack(alignment: .top) {
                        VStack(spacing: 0) {
                            zone(color: .green, label: "GREEN")
                            zone(color: .yellow, label: "YELLOW")
                            zone(color: .red, label: "RED")
                        }
                        .frame(width: 80, height: 300)

                        Image(systemName: "arrowshape.left.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                            .offset(y: yOffset)
                            .padding(.leading, 100)
                    }
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                            yOffset = 300
                        }
                    }

                    VStack(spacing: 10) {
                        
                        ZStack {
                            Image("Bow")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 220, height: 150)

                            if showButton {
                                Image("ArrowCutout")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 200)
                            }
                            
                            if let img = weaponImage {
                                Image(uiImage: img)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .rotationEffect(.degrees(90))
                            }
                        }
                        
                        if showButton {
                            Button("Get your weapon!") {
                                weaponSheet = true
                                showButton = false
                            }
                            .buttonStyle(.bordered)
                            .background(.white)
                            .cornerRadius(8)
                        }

                        Button {
                            buttonPressed = true
                            
                            if yOffset >= 0 && yOffset <= 100 {
                                success = true
                                hasWon = true
                                hasLost = false
                                goNext = true
                            } else {
                                success = false
                                hasWon = false
                                hasLost = true
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
                        .disabled(weaponImage == nil)
                        .opacity(weaponImage == nil ? 0.5 : 1.0)
                    }
                }
                .padding(.bottom, 50)
            }

            if hasLost {
                LoseView()
                    .onAppear {
                        hasLost = false
                        buttonPressed = false
                        weaponImage = nil
                        showButton = true
                    }
            }
        }
        .sheet(isPresented: $weaponSheet) {
            BackgroundRemovalView(weapon: .constant ("an arrow (e.g. a pencil)"), onDone: { image in
                weaponImage = image
                weaponSheet = false
            })
        }
        .navigationDestination(isPresented: $goNext) {
            AftLionView()
        }
    }

    func zone(color: Color, label: String) -> some View {
        ZStack {
            Rectangle()
                .fill(color)
            Text(label)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(color == .yellow ? .black : .white)
        }
        .frame(height: 100)
    }
}

#Preview {
    LionView()
}
