import SwiftUI

struct QuestView: View {
    
    @State private var showingPopover = false
    @State private var showingPopover1 = false
    
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
                            )
                    }
                    NavigationLink(destination: ComingSoonView()) {
                        Text("Erymanthian Boar")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .bold()
                            .background(
                                Rectangle()
                                    .frame(width: 300, height: 70)
                                    .cornerRadius(8)
                                    .foregroundColor(.gray)
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
                            )
                    }
                    NavigationLink(destination: BeforeStymphalianView()) {
                        Text("Stymphalian Birds")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .bold()
                            .background(
                                Image("StymphalianPainting")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 300, height: 70)
                                    .clipped()
                                    .cornerRadius(8)
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
                    
            }
            .navigationTitle("Your Labours")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarBackButtonHidden(true)
        
            
        }
    }
}

#Preview {
    QuestView()
}
