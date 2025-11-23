import SwiftUI

struct QuestView: View {
    
    @State private var showingPopover = false
    @State private var showingPopover1 = false
    
    
    @State var showAugean = false
    @State private var showStymphalian = false
    @State private var showGeryon = false
    @State private var showCerberus = false
    
    
    @Environment(\.dismiss) var dismiss
    @State private var changeView: Bool = false
    
    
    init() {
        let appearance = UINavigationBarAppearance()
        
        
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
        
        
    }
}

//
//struct PreviewView: View {
//    @State private var changeView: Bool = false
//    
//    var body: some View {
//        //        if changeView == 0 {
//        //            QuestView()
//        //                .transition(.move(edge: .trailing))
//        //            
//        //        }
//        //        if changeView == 3 {
//        //            DeerView(changeView: $changeView)
//        //        }
//        //        if changeView == 5 {
//        //            AugeanView()
//        //        }
//        if changeView {
//            BeforeDeerView(changeView: $changeView)
//        }
//        //        
//        //        if changeView == 303 {
//        //            AftDeerView(changeView: $changeView)
//        //        }
//        //        if changeView == 105 {
//        //            BeforeAugeanView()
//        //        }
//        //        if changeView == 305 {
//        //            AftAugeanView()
//        //        }
//        //    }
//        
//    }
//}




#Preview {
    QuestView()
}

