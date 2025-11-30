import SwiftUI

struct QuestView: View {
    @Binding var scene: AppScene
    
    var body: some View {
        NavigationStack {
            // levels
            VStack(alignment: .leading){
                ScrollView {
                    VStack (spacing: 50) {
//                        NavigationLink(destination: ComingSoonView()) {
//                            Text("Nemean Lion")
//                                .font(.title)
//                                .foregroundStyle(.white)
//                                .bold()
//                                .background(
//                                    Rectangle()
//                                        .frame(width: 300, height: 70)
//                                        .cornerRadius(8)
//                                        .foregroundColor(.gray)
//                                        .brightness(-0.2)
//                                )
//                        }
//                        NavigationLink(destination: ComingSoonView()) {
//                            Text("Lernean Hydra")
//                                .font(.title)
//                                .foregroundStyle(.white)
//                                .bold()
//                                .background(
//                                    Rectangle()
//                                        .frame(width: 300, height: 70)
//                                        .cornerRadius(8)
//                                        .foregroundColor(.gray)
//                                        .brightness(-0.2)
//                                )
//                        }
                        
                        Button {
                            scene = .startDeer
                            
                        } label: {
                            Text("Ceryneian Hind")
                                .font(.title)
                                .foregroundStyle(.white)
                                .bold()
                                .background(
                                    Image("DeerPainting")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 350, height: 70)
                                        .cornerRadius(8)
                                        .brightness(-0.2)
                                )
                        }
//                        NavigationLink(destination: ComingSoonView()) {
//                            Text("Erymanthian Boar")
//                                .font(.title)
//                                .foregroundStyle(.white)
//                                .bold()
//                                .background(
//                                    Rectangle()
//                                        .frame(width: 300, height: 70)
//                                        .cornerRadius(8)
//                                        .foregroundColor(.gray)
//                                        .brightness(-0.2)
//                                )
//                        }
                        Button() {
                            scene = .startAugean
                        } label: {
                            Text("Augean Stables")
                                .font(.title)
                                .foregroundStyle(.white)
                                .bold()
                                .background(
                                    Image("AugeanPainting")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 350, height: 70)
//                                        .clipped()
                                        .cornerRadius(8)
                                        .brightness(-0.2)
                                )
                        }
                        Button {
                            scene = .startStymphalian
                        } label: {
                            Text("Stymphalian Birds")
                                .font(.title)
                                .foregroundStyle(.white)
                                .bold()
                                .background(
                                    Image("StymphalianPainting")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 350, height: 70)
                                        .clipped()
                                        .cornerRadius(8)
                                        .brightness(-0.2)
                                )
                        }
//                        NavigationLink(destination: ComingSoonView()) {
//                            Text("Cretan Bull")
//                                .font(.title)
//                                .foregroundStyle(.white)
//                                .bold()
//                                .background(
//                                    Rectangle()
//                                        .frame(width: 300, height: 70)
//                                        .cornerRadius(8)
//                                        .foregroundColor(.gray)
//                                        .brightness(-0.2)
//                                )
//                        }
//                        NavigationLink(destination: ComingSoonView()) {
//                            Text("Mares of Diomedes")
//                                .font(.title)
//                                .foregroundStyle(.white)
//                                .bold()
//                                .background(
//                                    Rectangle()
//                                        .frame(width: 300, height: 70)
//                                        .cornerRadius(8)
//                                        .foregroundColor(.gray)
//                                        .brightness(-0.2)
//                                )
//                        }
//                        NavigationLink(destination: ComingSoonView()) {
//                            Text("Belt of Hippolyta")
//                                .font(.title)
//                                .foregroundStyle(.white)
//                                .bold()
//                                .background(
//                                    Rectangle()
//                                        .frame(width: 300, height: 70)
//                                        .cornerRadius(8)
//                                        .foregroundColor(.gray)
//                                        .brightness(-0.2)
//                                )
//                        }
                        Button {
                            scene = .startGeryon
                        } label:  {
                            Text("Cattle of Geryon")
                                .font(.title)
                                .foregroundStyle(.white)
                                .bold()
                                .background(
                                    Image("GeryonPainting")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 350, height: 70)
                                        .clipped()
                                        .cornerRadius(8)
                                        .brightness(-0.2)
                                )
                        }
//                        NavigationLink(destination: ComingSoonView()) {
//                            Text("Golden Apples")
//                                .font(.title)
//                                .foregroundStyle(.white)
//                                .bold()
//                                .background(
//                                    Rectangle()
//                                        .frame(width: 300, height: 70)
//                                        .cornerRadius(8)
//                                        .foregroundColor(.gray)
//                                        .brightness(-0.2)
//                                )
//                        }
                        Button {
                            scene = .startCerberus
                        } label: {
                            Text("Cerberus")
                                .font(.title)
                                .foregroundStyle(.white)
                                .bold()
                                .background(
                                    Image("CerberusPainting")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 350, height: 70)
                                        .clipped()
                                        .cornerRadius(8)
                                        .brightness(-0.2)
                                )
                        }
                    }
                    .padding()
                }
                
                .scrollIndicators(.hidden)
                .scrollClipDisabled()
                
                .background {
                    Image("Grass")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .offset(x: -20)
                        .brightness(-0.25)
                    
                }
                
                .navigationTitle("Your Labours")
                
                
                .toolbarTitleDisplayMode(.inlineLarge)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        
                        Button {
                            scene = .startDeer
                        } label: {
                            Image(systemName: "play.fill")
                        }
                    }
                    
                }
                
                .navigationBarBackButtonHidden(true)
            }
            .navigationTitle("Your Labours")

        }
    }
}


#Preview {
    QuestView(scene: .constant(.quest))
}

