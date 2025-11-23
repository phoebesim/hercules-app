import SwiftUI
struct ContentView: View {
    @State private var startDeer = false
    @State private var startAugean = false
    @State private var startStymphalian = false
    @State private var startGeryon = false
    @State private var startCerberus = false
    
    @State private var continueDeer = false
    @State private var continueAugean = false
    @State private var continueStymphalian = false
    @State private var continueGeryon = false
    @State private var continueCerberus = false
    
    @State private var endDeer = false
    @State private var endAugean = false
    @State private var endStymphalian = false
    @State private var endGeryon = false
    @State private var endCerberus = false
    
    
    var body: some View {
        if startDeer {
            BeforeDeerView(startDeer: $startDeer, continueDeer: $continueDeer)
        }
        else if startAugean {
            BeforeAugeanView()
        }
        else if startStymphalian {
            BeforeStymphalianView()
        }
        else if startGeryon {
            BeforeGeryonView()
        }
        else if startCerberus {
            BeforeCerberusView()
        }
        
        
        else if continueDeer {
            DeerView(continueDeer: $continueDeer, endDeer: $endDeer)
        }
        else if continueAugean {
            AugeanView()
        }
        else if continueStymphalian {
            StymphalianView()
        }
        else if continueGeryon {
            GeryonView()
        }
        else if continueCerberus {
            CerberusView()
        }
        
        else if endDeer {
            AftDeerView(endDeer: $endDeer, startAugean: $startAugean)
        }
        else if endAugean {
            AftAugeanView()
        }
        else if endStymphalian {
            AftStymphalianView()
        }
        else if endGeryon {
            AftGeryonView()
        }
        else if endCerberus {
            AftCerberusView()
        }
        
        else {
            NavigationStack {
                VStack(alignment: .leading){
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
                            
                            Button {
                                startDeer = true
                            } label: {
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
                            Button() {
                                startAugean = true
                            } label: {
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
                    //            .navigationBarTitleDisplayMode(.inline)
                    //.navigationBarTitleDisplayMode(.large)
                    .toolbarTitleDisplayMode(.inlineLarge)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            
                            NavigationLink {
                                //              BeforeDeerView()
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
}



#Preview {
    ContentView()
}
