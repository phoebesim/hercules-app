/*import SwiftUI
 
 struct MaresOfDiomedesView: View {
 // 1. Controls the opacity of the black overlay (0.0 = clear, 1.0 = solid black)
 @State private var driftOpacity: Double = 0.0
 
 // 2. State to manage the periodic darkening
 @State private var isDrifting = true
 
 // 3. Timer object to schedule the drift/fade-in
 @State private var timer: Timer?
 
 // Configuration constants
 let maxDriftOpacity: Double = 0.7 // How dark the screen gets
 let fadeDuration: Double = 3.0    // How long one fade-in or fade-out takes
 let driftInterval: Double = 8.0   // How often the screen starts fading (time between "wakes")
 
 var body: some View {
 ZStack {
 // --- 1. Your Main Content Here ---
 // Example content:
 VStack {
 Text("Don't Drift Off!")
 .font(.largeTitle)
 .foregroundColor(.white)
 Text("Tap the screen to stay awake...")
 .foregroundColor(.gray)
 }
 .frame(maxWidth: .infinity, maxHeight: .infinity)
 .background(Color.blue.gradient) // Background color for visibility
 
 // --- 2. The Black Overlay (The 'Drifting' Effect) ---
 Color.black
 .opacity(driftOpacity)
 .edgesIgnoringSafeArea(.all)
 .animation(.easeIn(duration: fadeDuration), value: driftOpacity) // Smooth animation
 
 // --- 3. Interaction Area ---
 // Detects a tap anywhere on the screen
 Color.clear
 .contentShape(Rectangle())
 .onTapGesture {
 wakeUp()
 }
 }
 .onAppear {
 startDrifting()
 }
 .onDisappear {
 stopDrifting()
 }
 }
 
 // MARK: - Helper Functions
 
 func startDrifting() {
 // Start the initial fading and set up the repeating timer
 isDrifting = true
 scheduleNextDrift()
 }
 
 func stopDrifting() {
 // Stop the timer when the view disappears
 timer?.invalidate()
 timer = nil
 }
 
 // Schedules the next time the screen will start fading in (getting darker)
 func scheduleNextDrift() {
 // Ensure any previous timer is stopped
 timer?.invalidate()
 
 timer = Timer.scheduledTimer(withTimeInterval: driftInterval, repeats: true) { _ in
 if self.isDrifting {
 // Start the fade-in sequence
 withAnimation {
 self.driftOpacity = self.maxDriftOpacity
 }
 
 // After the fade-in duration, start the fade-out (to simulate intermittence)
 DispatchQueue.main.asyncAfter(deadline: .now() + fadeDuration + 1.0) {
 if self.isDrifting {
 withAnimation {
 self.driftOpacity = 0.0
 }
 }
 }
 }
 }
 // Immediately trigger the first fade cycle
 timer?.fire()
 }
 
 func wakeUp() {
 // Reset the screen to clear
 withAnimation(.easeOut(duration: 0.5)) {
 driftOpacity = 0.0
 }
 
 // Reset the timer to start the whole cycle over
 stopDrifting()
 startDrifting()
 }
 }
 
 #Preview {
 MaresOfDiomedesView()
 }
 
 */

/*
import SwiftUI

// A simple separate view struct for the end screens
struct GameOverView: View {
    let title: String
    let message: String
    let color: Color
    let resetAction: () -> Void

    var body: some View {
        ZStack {
            Color(UIColor.systemBackground).opacity(0.9)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                Text(title)
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(color)
                Text(message)
                    .font(.title2)
                    .multilineTextAlignment(.center)

                Button("Play Again") {
                    resetAction()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding(40)
        }
    }
}

// Define the game states
enum GameState {
    case playing, won, lost
}

struct MaresOfDiomedesView: View {
    // 1. Controls the opacity of the black overlay (0.0 = clear, 1.0 = solid black)
    @State private var driftOpacity: Double = 0.0
    
    // 2. State to manage the periodic darkening
    @State private var isDrifting = true
    
    // 3. Timer object to schedule the drift/fade-in
    @State private var timer: Timer?

    // Configuration constants
    let maxDriftOpacity: Double = 0.8 // How dark the screen gets
    let fadeDuration: Double = 3.0    // How long one fade-in takes
    let driftInterval: Double = 8.0   // How often the screen starts fading (time between "wakes")
    
    // New Game State Variables
    @State private var gameState: GameState = .playing
    @State private var wakeCount: Int = 0 // Track successful wakes
    let requiredWakesToWin = 5             // Set a win condition

    var body: some View {
        ZStack {
            // --- 1. Your Main Content Here ---
            VStack {
                Text("Don't Drift Off!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Text("Wakes: \(wakeCount)/\(requiredWakesToWin)")
                    .foregroundColor(.white)
                    .padding(.top, 5)
                Text("Tap the screen to stay awake...")
                    .foregroundColor(.gray)
                    .padding(.top, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue.gradient) // Background color for visibility
            
            // --- 2. The Black Overlay (The 'Drifting' Effect) ---
            Color.black
                .opacity(driftOpacity)
                .edgesIgnoringSafeArea(.all)
                .animation(.easeIn(duration: fadeDuration), value: driftOpacity) // Smooth animation

            // --- 3. Interaction Area ---
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    wakeUp()
                }
            
            // --- 4. Game Over Screens ---
            if gameState == .lost {
                GameOverView(title: "You Lost!", message: "The screen went dark. You fell asleep.", color: .red) {
                    resetGame()
                }
            } else if gameState == .won {
                GameOverView(title: "You Won!", message: "You stayed awake \(requiredWakesToWin) times!", color: .green) {
                    resetGame()
                }
            }
        }
        .onAppear {
            startDrifting()
        }
        .onDisappear {
            stopDrifting()
        }
    }
    
    // MARK: - Helper Functions
    
    func startDrifting() {
        // Start the initial fading and set up the repeating timer
        isDrifting = true
        scheduleNextDrift()
    }
    
    func stopDrifting() {
        // Stop the timer when the view disappears or game ends
        timer?.invalidate()
        timer = nil
    }

    func scheduleNextDrift() {
        timer?.invalidate()

        timer = Timer.scheduledTimer(withTimeInterval: driftInterval, repeats: true) { _ in
            guard self.gameState == .playing && self.isDrifting else { return }
            
            // Start the fade-in sequence
            withAnimation {
                self.driftOpacity = self.maxDriftOpacity
            }
            
            // CHECK FOR LOSS: Schedule a check after the fade-in and a short buffer
            // If the opacity is still max after this time, the user lost
            DispatchQueue.main.asyncAfter(deadline: .now() + fadeDuration + 0.5) {
                if self.gameState == .playing {
                    if self.driftOpacity >= self.maxDriftOpacity {
                        // User failed to tap in time
                        self.gameState = .lost
                        self.stopDrifting()
                    } else {
                        // User tapped in time during the fade-in, but the timer just fired the next fade. This path is obsolete with the tap logic below.
                    }
                }
            }
        }
        // Immediately trigger the first fade cycle
        timer?.fire()
    }

    func wakeUp() {
        guard gameState == .playing else { return } // Only allow taps when playing
        
        // Reset the screen
        withAnimation(.easeOut(duration: 0.5)) {
            driftOpacity = 0.0
        }
        
        // Track progress
        wakeCount += 1
        
        if wakeCount >= requiredWakesToWin {
            gameState = .won // Transition to the Won state
            stopDrifting()    // Stop the timer
        } else {
            // Reset the timer to start the whole cycle over for the next round
            stopDrifting()
            startDrifting()
        }
    }
    
    func resetGame() {
        gameState = .playing
        wakeCount = 0
        driftOpacity = 0.0
        // Ensure the timer is stopped and restarted correctly for a new game
        stopDrifting()
        startDrifting()
    }
}

#Preview {
    MaresOfDiomedesView()
}

*/

import SwiftUI

// A simple separate view struct for the end screens
struct GameOverView: View {
    let title: String
    let message: String
    let color: Color
    let resetAction: () -> Void

    var body: some View {
        ZStack {
            Color(UIColor.systemBackground)
                .opacity(0.9)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text(title)
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(color)

                Text(message)
                    .font(.title2)
                    .multilineTextAlignment(.center)

                Button("Play Again") {
                    resetAction()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding(40)
        }
    }
}

// Game states
enum GameState {
    case playing, won, lost
}

@MainActor
struct MaresOfDiomedesView: View {

    @State private var driftOpacity: Double = 0.0
    @State private var isDrifting = true
    @State private var wakeCount: Int = 0
    @State private var gameState: GameState = .playing

    @State private var timer: Timer?

    // Game configuration
    let maxDriftOpacity: Double = 0.8
    let fadeDuration: Double = 3.5
    let driftInterval: Double = 8.0
    let requiredWakesToWin = 5

    var body: some View {
        ZStack {
            VStack {
                Text("Don't Drift Off!")
                    .font(.largeTitle)
                    .foregroundColor(.white)

                Text("Wakes: \(wakeCount)/\(requiredWakesToWin)")
                    .foregroundColor(.white)
                    .padding(.top, 5)

                Text("Tap the screen to stay awake...")
                    .foregroundColor(.gray)
                    .padding(.top, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue.gradient)

            Color.black
                .opacity(driftOpacity)
                .ignoresSafeArea()
                .animation(.easeIn(duration: fadeDuration), value: driftOpacity)

            Color.clear
                .contentShape(Rectangle())
                .onTapGesture { wakeUp() }

            if gameState == .lost {
                GameOverView(
                    title: "You Lost!",
                    message: "The screen went dark. You fell asleep.",
                    color: .red,
                    resetAction: resetGame
                )
            }

            if gameState == .won {
                GameOverView(
                    title: "You Won!",
                    message: "You stayed awake \(requiredWakesToWin) times!",
                    color: .green,
                    resetAction: resetGame
                )
            }
        }
        .onAppear { startDrifting() }
        .onDisappear { stopDrifting() }
    }

    // MARK: - Logic

    func startDrifting() {
        isDrifting = true
        scheduleNextDrift()
    }

    func stopDrifting() {
        timer?.invalidate()
        timer = nil
    }

    func scheduleNextDrift() {
        stopDrifting()

        timer = Timer.scheduledTimer(withTimeInterval: driftInterval, repeats: true) { _ in
            Task { @MainActor in
                guard gameState == .playing && isDrifting else { return }

                withAnimation {
                    driftOpacity = maxDriftOpacity
                }

                // Check for loss after fadeDuration + buffer
                Task { @MainActor in
                    try? await Task.sleep(for: .seconds(fadeDuration + 0.5))

                    if gameState == .playing,
                       driftOpacity >= maxDriftOpacity {
                        gameState = .lost
                        stopDrifting()
                    }
                }
            }
        }

        timer?.fire()
    }

    func wakeUp() {
        guard gameState == .playing else { return }

        withAnimation(.easeOut(duration: 0.5)) {
            driftOpacity = 0.0
        }

        wakeCount += 1

        if wakeCount >= requiredWakesToWin {
            gameState = .won
            stopDrifting()
        } else {
            stopDrifting()
            startDrifting()
        }
    }

    func resetGame() {
        gameState = .playing
        wakeCount = 0
        driftOpacity = 0.0
        stopDrifting()
        startDrifting()
    }
}

#Preview {
    MaresOfDiomedesView()
}
