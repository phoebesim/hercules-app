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
    
    @State private var startStory = true
    @State private var endStory = false
    
    
    
    var body: some View {
        
        if startDeer {
            BeforeDeerView(startDeer: $startDeer, continueDeer: $continueDeer)
        }
        else if startAugean {
            BeforeAugeanView(startAugean: $startAugean, continueAugean: $continueAugean)
        }
        else if startStymphalian {
            BeforeStymphalianView(startStymphalian: $startStymphalian, continueStymphalian: $continueStymphalian)
        }
        else if startGeryon {
            BeforeGeryonView(startGeryon: $startGeryon, continueGeryon: $continueGeryon)
        }
        else if startCerberus {
            BeforeCerberusView(startCerberus: $startCerberus, continueCerberus: $continueCerberus)
        }
        
        
        else if continueDeer {
            DeerView(continueDeer: $continueDeer, endDeer: $endDeer)
        }
        else if continueAugean {
            AugeanView(continueAugean: $continueAugean, endAugean: $endAugean)
        }
        else if continueStymphalian {
            StymphalianView(continueStymphlian: $continueStymphalian, endStymphalian: $endStymphalian)
        }
        else if continueGeryon {
            GeryonView(continueGeryon: $continueGeryon, endGeryon: $endGeryon)
        }
        else if continueCerberus {
            CerberusView(continueCerberus: $continueCerberus, endCerberus: $endCerberus)
        }
        
        else if endDeer {
            AftDeerView(endDeer: $endDeer, startAugean: $startAugean)
        }
        else if endAugean {
            AftAugeanView(endAugean: $endAugean, startStymphalian: $startStymphalian)
        }
        else if endStymphalian {
            AftStymphalianView(endStymphalian: $endStymphalian, startGeryon: $startGeryon)
        }
        else if endGeryon {
            AftGeryonView(endGeryon: $endGeryon, startCerberus: $startCerberus)
        }
        else if endCerberus {
            AftCerberusView(endCerberus: $endCerberus, endStory: $endStory)
        }
        
        else if startStory {
            FirstinfoView(startStory: $startStory)
        }
        
        else if endStory {
            EndView(endStory: $endStory)
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
                            Button {
                                startStymphalian = true
                            } label: {
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
                            Button {
                                startGeryon = true
                            } label:  {
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
                            Button {
                                startCerberus = true
                            } label: {
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
                    
                    .toolbarTitleDisplayMode(.inlineLarge)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            
                            Button {
                                startDeer = true
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
