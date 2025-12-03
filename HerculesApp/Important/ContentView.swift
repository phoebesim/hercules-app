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
    @State var completedDeer = false
    @State var completedAugean = false
    @State var completedStymphalian = false
    @State var completedGeryon = false
    @State var completedCerberus = false 
    
    
    
    
    var body: some View {
        
        switch scene {
        case .startDeer:
            BeforeDeerView(scene: $scene)
        case .continueDeer:
            DeerView(scene: $scene)
        case .endDeer:
            AftDeerView(scene: $scene, completedDeer: $completedDeer)
        case .startAugean:
            BeforeAugeanView(scene: $scene)
        case .continueAugean:
            AugeanView(scene: $scene)
        case .endAugean:
            AftAugeanView(scene: $scene, completedAugean: $completedAugean)
        case .startStymphalian:
            BeforeStymphalianView(scene: $scene)
        case .continueStymphalian:
            StymphalianView(scene: $scene)
        case .endStymphalian:
            AftStymphalianView(scene: $scene, completedStymphalian: $completedStymphalian)
        case .startGeryon:
            BeforeGeryonView(scene: $scene)
        case .continueGeryon:
            GeryonView(scene: $scene)
        case .endGeryon:
            AftGeryonView(scene: $scene, completedGeryon: $completedGeryon)
        case .startCerberus:
            BeforeCerberusView(scene: $scene)
        case .continueCerberus:
            CerberusView(scene: $scene)
        case .endCerberus:
            AftCerberusView(scene: $scene, completedCerberus: $completedCerberus)
        case .quest:
            QuestView(scene: $scene, completedDeer: $completedDeer, completedAugean: $completedAugean, completedStymphalian: $completedStymphalian, completedGeryon: $completedGeryon, completedCerberus: $completedCerberus)
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
