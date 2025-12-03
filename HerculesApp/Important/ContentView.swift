import SwiftUI

enum AppScene {
    case startDeer
    case continueDeer
    case endDeer
    
    case startAugean
    case continueAugean
    case endAugean
    
    case startStymphalian
    case continueStymphalian
    case endStymphalian
    
    case startGeryon
    case continueGeryon
    case endGeryon
    
    case startCerberus
    case continueCerberus
    case endCerberus
    
    case quest
    
    case firstInfo
    case lastInfo
    
}




struct ContentView: View {
    
    @State var scene = AppScene.firstInfo
    
    
    //    @State private var startDeer = false
    //    @State private var startAugean = false
    //    @State private var startStymphalian = false
    //    @State private var startGeryon = false
    //    @State private var startCerberus = false
    //
    //    @State private var continueDeer = false
    //    @State private var continueAugean = false
    //    @State private var continueStymphalian = false
    //    @State private var continueGeryon = false
    //    @State private var continueCerberus = false
    //
    //    @State private var endDeer = false
    //    @State private var endAugean = false
    //    @State private var endStymphalian = false
    //    @State private var endGeryon = false
    //    @State private var endCerberus = false
    //
    //    @State private var startStory = true
    //    @State private var endStory = false
    
    
    
    
    var body: some View {
        
        switch scene {
        case .startDeer:
            BeforeDeerView(scene: $scene)
        case .continueDeer:
            DeerView(scene: $scene)
        case .endDeer:
            AftDeerView(scene: $scene)
        case .startAugean:
            BeforeAugeanView(scene: $scene)
        case .continueAugean:
            AugeanView(scene: $scene)
        case .endAugean:
            AftAugeanView(scene: $scene)
        case .startStymphalian:
            BeforeStymphalianView(scene: $scene)
        case .continueStymphalian:
            StymphalianView(scene: $scene)
        case .endStymphalian:
            AftStymphalianView(scene: $scene)
        case .startGeryon:
            BeforeGeryonView(scene: $scene)
        case .continueGeryon:
            GeryonView(scene: $scene)
        case .endGeryon:
            AftGeryonView(scene: $scene)
        case .startCerberus:
            BeforeCerberusView(scene: $scene)
        case .continueCerberus:
            CerberusView(scene: $scene)
        case .endCerberus:
            AftCerberusView(scene: $scene)
        case .quest:
            QuestView(scene: $scene)
        case .firstInfo:
            FirstinfoView(scene: $scene)
        case .lastInfo:
            EndView(scene: $scene)
        }
        
        
    }
}

#Preview {
    ContentView()
}
