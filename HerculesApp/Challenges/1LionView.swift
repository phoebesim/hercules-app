/*import SwiftUI
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

                            if !success {
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
                WinView(nextInfoView: .constant(AnyView(AftLionView())))
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
*/

/*import SwiftUI
import Combine

struct LionView: View {
    @State private var yOffset: CGFloat = 0
    @State private var success: Bool = false
    @State private var hasWon: Bool = false
    @State private var buttonPressed: Bool = false

    // MARK: - Added for image selection
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
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

                Image("Lion")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)

                Spacer()

                HStack(alignment: .center, spacing: 40) {

                    // ------- LEFT SIDE: ZONES + MOVING ARROW (now can be custom image) -------
                    ZStack(alignment: .top) {
                        VStack(spacing: 0) {
                            zone(color: .green, label: "GREEN")
                            zone(color: .yellow, label: "YELLOW")
                            zone(color: .red, label: "RED")
                        }
                        .frame(width: 80, height: 300)

                        if let img = weaponImage {
                            Image(uiImage: img)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 200) // Adjust size as needed
                                .offset(y: yOffset)
                                .padding(.leading, 100)
                        } else {
                            Image(systemName: "arrowshape.left.fill")
                                .foregroundColor(.white)
                                .offset(y: yOffset)
                                .padding(.leading, 100)
                        }
                    }
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                            yOffset = 300
                        }
                    }

                    // ------- RIGHT SIDE: BOW + SHOOT BUTTON -------
                    VStack(spacing: 10) {
                        ZStack {
                            Image("Bow")
                                .resizable()
                                .frame(width: 220, height: 150)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

                            // Original "Pencil" is now only shown if no weaponImage is selected and not successful
                            if weaponImage == nil && !success {
                                Image("ArrowCutout")
                                    .resizable()
                                    .frame(width: 80, height: 200)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            }
                        }
                        
                        // MARK: - Added "Get your weapon!" button
                        if showButton {
                            Button("Get your weapon!"){
                                weaponSheet = true
                                showButton = false
                            }
                            .buttonStyle(.bordered)
                            .background(.white)
                            .cornerRadius(8)
                        }

                        Button {
                            buttonPressed = true
                            if yOffset > -109 && yOffset < 301 {
                                success = true
                                hasWon = true // Set hasWon to true on success
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

            // MARK: - Sheet for weapon selection
            .sheet(isPresented: $weaponSheet) {
                BackgroundRemovalView(onDone: { image in weaponImage = image; weaponSheet = false })
            }

            if hasWon {
                WinView(nextInfoView: .constant(AnyView(AftLionView())))
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

*/

import SwiftUI
import Combine

struct LionView: View {
    @State private var yOffset: CGFloat = 0
    @State private var success: Bool = false
    @State private var hasWon: Bool = false
    @State private var hasLost: Bool = false
    @State private var buttonPressed: Bool = false

    // MARK: - Image selection states
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

                        // Display custom weapon image or default arrow
                        if let img = weaponImage {
                            Image(uiImage: img)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .offset(y: yOffset)
                                .padding(.leading, 100)
                        } else {
                            Image(systemName: "arrowshape.left.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                                .offset(y: yOffset)
                                .padding(.leading, 100)
                        }
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

                            if weaponImage == nil && !buttonPressed {
                                Image("ArrowCutout")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 200)
                            }
                        }
                        
                        if showButton {
                            Button("Get your weapon!") {
                                weaponSheet = true
                                showButton = false
                            }
                            .buttonStyle(.bordered)
                            .tint(.black)
                            .background(.white)
                            .cornerRadius(8)
                        }

                        Button {
                            buttonPressed = true
                            
                            
                            
                            if yOffset >= 0 && yOffset <= 100 {
                                success = true
                                hasWon = true
                                hasLost = false
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

            
            .sheet(isPresented: $weaponSheet) {
                BackgroundRemovalView(onDone: { image in
                    weaponImage = image
                    weaponSheet = false
                })
            }

            if hasWon {
                WinView(nextInfoView: .constant(AnyView(AftLionView())))
            }
            
            if hasLost {
                ZStack {
                    Color.black.opacity(0.8)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 20) {
                        Text("You Missed!")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.red)
                        
                        Text("The lion got away...")
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        Button("Try Again") {
                            hasLost = false
                            buttonPressed = false
                            weaponImage = nil
                            showButton = true
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                    .padding(40)
                }
            }
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
        .frame(height: 100)     }
}

#Preview {
    LionView()
}
