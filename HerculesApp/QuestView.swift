import SwiftUI

struct QuestView: View {
    
    @State private var showingPopover = false
    @State private var showingPopover1 = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Grass")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .brightness(0.1)
                
                Button("Instructions") {
                    showingPopover = true
                }
                .zIndex(2)
                .foregroundColor(.black)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .offset(x: -120, y: -370)
                .popover(isPresented: $showingPopover) {
                    Text("Instructions: Scan different items based on the requirements! Complete all 12 labours to win!")
                        .font(.headline)
                        .padding()
                }
                
                VStack(spacing: 20) {
                    NavigationLink { BeforeLionView() } label: {
                        Icon("Lion", w: 50, h: 50)
                    }
                    Icon("x")
                    NavigationLink { BeforeHindView() } label: {
                        Icon("Deer", w: 60, h: 60)
                    }
                    Icon("x")
                    NavigationLink { BeforeStableView() } label: {
                        Icon("Stable", w: 50, h: 50)
                    }
                    Icon("StymphalianBirdFlying", w: 100, h: 200)
                }
                .offset(x: -150)
                
                VStack(spacing: 20) {
                    Icon("x")
                    Icon("x")
                    NavigationLink { AmazonView() } label: {
                        Icon("Amazon", w: 50, h: 100)
                    }
                    NavigationLink { GeryonView() } label: {
                        Icon("Geryon", w: 50, h: 50)
                    }
                    Icon("x")
                    NavigationLink { CerberusView() } label: {
                        Icon("Cerberus", w: 50, h: 50)
                    }
                }
                .offset(x: 150)
                
                
                
                Button {
                    showingPopover1 = true
                } label: {
                    Image(.hera)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                }
                .popover(isPresented: $showingPopover1) {
                    VStack {
                        Text("""
                        Goddess: Marriage, childbirth and women.
                        Main lover: Zeus
                        Appearance: Elegant, jealous, protective and arrogant.
                        Worship: Greece temples.
                        Known for: Punishing Zeus's mistresses and his other sons
                        """)
                        .font(.headline)
                        .padding()
                    }
                }
            }
        }
    }
}




struct Icon: View {
    var name: String
    var w: CGFloat
    var h: CGFloat
    
    init(_ name: String, w: CGFloat = 50, h: CGFloat = 50) {
        self.name = name
        self.w = w
        self.h = h
    }
    
    var body: some View {
        Image(name)
            .resizable()
            .frame(width: w, height: h)
            .contentShape(Rectangle())
    }
}

#Preview {
    QuestView()
}
