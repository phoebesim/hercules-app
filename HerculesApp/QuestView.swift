import SwiftUI

struct QuestView: View {
    
    @State private var showingPopover = false
    @State private var showingPopover1 = false
    
    @AppStorage("changeView") var changeView = 1
    @Environment(\.dismiss) var dismiss
    
    init() {
        let appearance = UINavigationBarAppearance()
        
        
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (spacing: 50) {
                    NavigationLink(destination: ComingSoonView()) {
                        Text("Nemean Lion")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .bold()
                            .background(
                                Rectangle()
                                    .frame(width: 300, height: 70)
                                    .cornerRadius(8)
                                    .foregroundColor(.gray)
                                    .brightness(-0.2)
                            )
                    }
                    NavigationLink(destination: ComingSoonView()) {
                        Text("Lernean Hydra")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .bold()
                            .background(
                                Rectangle()
                                    .frame(width: 300, height: 70)
                                    .cornerRadius(8)
                                    .foregroundColor(.gray)
                                    .brightness(-0.2)
                            )
                    }
                    NavigationLink(destination: BeforeDeerView()) {
                        Text("Ceryneian Hind")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .bold()
                            .background(
                                Image("DeerPainting")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 300, height: 70)
                                    .clipped()
                                    .cornerRadius(8)
                                    .brightness(-0.2)
                            )
                    }
                    NavigationLink(destination: ComingSoonView()) {
                        Text("Erymanthian Boar")
                            .font(.title)
                            .foregroundStyle(.white)
                            .bold()
                            .background(
                                Rectangle()
                                    .frame(width: 300, height: 70)
                                    .cornerRadius(8)
                                    .foregroundColor(.gray)
                                    .brightness(-0.2)
                            )
                    }
                    NavigationLink(destination: BeforeAugeanView()) {
                        Text("Augean Stables")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .bold()
                            .background(
                                Image("AugeanPainting")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 300, height: 70)
                                    .clipped()
                                    .cornerRadius(8)
                                    .brightness(-0.2)
                            )
                    }
                    NavigationLink(destination: BeforeStymphalianView()) {
                        Text("Stymphalian Birds")
                            .font(.title)
                            .foregroundStyle(.white)
                            .bold()
                            .background(
                                Image("StymphalianPainting")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 300, height: 70)
                                    .clipped()
                                    .cornerRadius(8)
                                    .brightness(-0.2)
                            )
                    }
                    NavigationLink(destination: ComingSoonView()) {
                        Text("Cretan Bull")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .bold()
                            .background(
                                Rectangle()
                                    .frame(width: 300, height: 70)
                                    .cornerRadius(8)
                                    .foregroundColor(.gray)
                                    .brightness(-0.2)
                            )
                    }
                    NavigationLink(destination: ComingSoonView()) {
                        Text("Mares of Diomedes")
                            .font(.title)
                            .foregroundStyle(.white)
                            .bold()
                            .background(
                                Rectangle()
                                    .frame(width: 300, height: 70)
                                    .cornerRadius(8)
                                    .foregroundColor(.gray)
                                    .brightness(-0.2)
                            )
                    }
                    NavigationLink(destination: ComingSoonView()) {
                        Text("Belt of Hippolyta")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .bold()
                            .background(
                                Rectangle()
                                    .frame(width: 300, height: 70)
                                    .cornerRadius(8)
                                    .foregroundColor(.gray)
                                    .brightness(-0.2)
                            )
                    }
                    NavigationLink(destination: BeforeGeryonView()) {
                        Text("Cattle of Geryon")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .bold()
                            .background(
                                Image("GeryonPainting")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 300, height: 70)
                                    .clipped()
                                    .cornerRadius(8)
                                    .brightness(-0.2)
                            )
                    }
                    NavigationLink(destination: ComingSoonView()) {
                        Text("Golden Apples of\nHerperides")
                            .font(.title)
                            .foregroundStyle(.white)
                            .bold()
                            .background(
                                Rectangle()
                                    .frame(width: 300, height: 70)
                                    .cornerRadius(8)
                                    .foregroundColor(.gray)
                                    .brightness(-0.2)
                            )
                    }
                    NavigationLink(destination: BeforeCerberusView()) {
                        Text("Cerberus")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .bold()
                            .background(
                                Image("CerberusPainting")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 300, height: 70)
                                    .clipped()
                                    .cornerRadius(8)
                                    .brightness(-0.2)
                            )
                    }
                }
                .padding()
            }
            
            .scrollIndicators(.hidden)
            
            .background {
                Image("Grass")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .offset(x: -20)
                    .brightness(-0.25)
                    
            }
           
        
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        BeforeDeerView()
                    } label: {
                        Image(systemName: "play.fill")
                    }
                }
            }
            .navigationTitle("Your Labours")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarBackButtonHidden(true)
        }
    }
}


struct PreviewView: View {
    @AppStorage("changeView") var changeView = 1
    
    var body: some View {
        if changeView == 1 {
            QuestView()
        }
        if changeView == 3 {
            DeerView()
        }
        if changeView == 5 {
            AugeanView()
        }
        
        
        
    }
    
}




#Preview {
    PreviewView()
}
