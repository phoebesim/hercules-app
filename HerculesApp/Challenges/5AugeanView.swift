//
//  AugeanView.swift
//  HerculesApp
//
//  Created by T Krobot on 19/11/25.
//

//
//  AugeanView.swift
//  HerculesApp
//
//  Created by Phoebe Sim on 12/11/25.
//

import SwiftUI
import ConfettiSwiftUI

enum PipeType {
    case straight, corner, end, t
}

struct Pipe: Identifiable {
    var type: PipeType
    let id = UUID()
    var rotation: Double = 0
    
    var connections: Set<Direction> {
        let base: Set<Direction>
        switch type {
        case .straight:
            base = [.top, .bottom]
        case .corner:
            base = [.top, .right]
        case .end:
            base = [.right]
        case .t:
            base = [.top, .bottom, .right]
        }
        return Set(base.map { $0.rotated(by: Int(rotation)) })
    }
}

enum Direction: CaseIterable {
    case top, right, bottom, left
    
    func rotated(by degrees: Int) -> Direction {
        let turns = Int(degrees / 90) % 4
        let all = Direction.allCases
        let index = all.firstIndex(of: self)!
        return all[(index + turns) % 4]
    }
    var opposite: Direction {
        switch self {
        case .top: return .bottom
        case .bottom: return .top
        case .left: return .right
        case .right: return .left
        }
    }
}

struct AugeanView: View {
    //here is the change
    @State private var confettiTrigger: Int = 0

    let lightRed = Color(red: 0.969, green: 0.667, blue: 0.584)
    @State private var grid: [[Pipe]] = [[
        Pipe(type: .end, rotation: 0),
        Pipe(type: .end, rotation: 180),
        Pipe(type: .corner, rotation: 270),
        Pipe(type: .end, rotation: 270)
    ],[
        Pipe(type: .t, rotation: 180),
        Pipe(type: .t, rotation: 180),
        Pipe(type: .t, rotation: 90),
        Pipe(type: .end, rotation: 0)
    ], [
        Pipe(type: .corner, rotation: 90),
        Pipe(type: .corner, rotation: 90),
        Pipe(type: .t, rotation: 90),
        Pipe(type: .corner, rotation: 270)
    ],[
        Pipe(type: .end, rotation: 270),
        Pipe(type: .corner, rotation: 180),
        Pipe(type: .corner, rotation: 90),
        Pipe(type: .end, rotation: 270)
    ]]
    
    @Binding var scene: AppScene
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(.grass)
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 500, height: 500)
                
                GeometryReader { geometry in
                    Image(.dirt)
                        .resizable()
                        .frame(width: 450, height: 450)
                        .position(x: geometry.size.width / 1.3, y: geometry.size.height / 2.5)
                    Image(.dirt)
                        .resizable()
                        .frame(width: 450, height: 450)
                        .position(x: geometry.size.width / 3, y: geometry.size.height / 2)
                }
                
                VStack {
                    Text("Tap the squares in the grid of river to rotate them and fill all the river!")
                        .font(.title)
                        .foregroundStyle(.black)
                        .padding()
                        .background(.white.opacity(0.6))
                        .cornerRadius(10)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 70)
                    
                    VStack(spacing: 4) {
                        ForEach(0..<4, id: \.self) { row in
                            HStack(spacing: 4) {
                                ForEach(0..<4, id: \.self) { col in
                                    pipeCell(row: row, col: col)
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                
                if isComplete {
                    YouWonViewAugean(scene: $scene)
                }
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        scene = .quest
                    } label: {
                        Image(systemName: "house")
                            .foregroundStyle(.primary)
                            .frame(width: 50, height: 50)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    @ViewBuilder
    func pipeCell(row: Int, col: Int) -> some View {
        PipeView(
            pipe: grid[row][col],
            isConnected: connectedPipes.contains(where: { $0.row == row && $0.col == col }),
            backgroundColor: (row == 2 && col == 2) ? lightRed : .white
        )
        .onTapGesture {
            rotatePipe(row: row, col: col)
        }
    }
    
    func rotatePipe(row: Int, col: Int) {
        let pipe = grid[row][col]
        grid[row][col].rotation = (pipe.rotation + 90).truncatingRemainder(dividingBy: 360)
    }
    
    var connectedPipes: [(row: Int, col: Int)] {
        var connected: [(row: Int, col: Int)] = [(2, 2)]
        var queue: [(row: Int, col: Int)] = [(2, 2)]
        var visited = Set<String>()
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            let key = "\(current.row), \(current.col)"
            if visited.contains(key) { continue }
            visited.insert(key)
            
            let pipe = grid[current.row][current.col]
            
            for dir in pipe.connections {
                let next = neighbour(of: current, in: dir)
                if let n = next, !visited.contains("\(n.row), \(n.col)") {
                    let neighbourPipe = grid[n.row][n.col]
                    if neighbourPipe.connections.contains(dir.opposite) {
                        connected.append(n)
                        queue.append(n)
                    }
                }
            }
        }
        return connected
    }
    
    func neighbour(of pos: (row: Int, col: Int), in dir: Direction) -> (row: Int, col: Int)? {
        let (r, c) = pos
        switch dir {
        case .top: return r > 0 ? (r - 1, c) : nil
        case .bottom: return r < 3 ? (r + 1, c) : nil
        case .left: return c > 0 ? (r, c - 1) : nil
        case .right: return c < 3 ? (r, c + 1) : nil
        }
    }
    
    var isComplete: Bool {
        connectedPipes.count == 16
    }
}

// Extracted win overlay to reduce body complexity
private struct WinOverlay: View {
    @Binding var confettiTrigger: Int
    @Binding var scene: AppScene
    
    var body: some View {
        YouWonViewDeer(scene: $scene)
    }
}

struct PipeView: View {
    let pipe: Pipe
    let isConnected: Bool
    var backgroundColor: Color = .white
    
    var pipeShape: some Shape {
        switch pipe.type {
        case .straight:
            return AnyShape(StraightPipe())
        case .corner:
            return AnyShape(CornerPipe())
        case .end:
            return AnyShape(EndPipe())
        case .t:
            return AnyShape(TPipe())
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(backgroundColor)
                .frame(width: 70, height: 70)
            pipeShape
                .stroke(isConnected ? Color.blue : Color.gray, lineWidth: 8)
                .frame(width: 60, height: 60)
                .rotationEffect(.degrees(pipe.rotation))
        }
    }
}

struct StraightPipe: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        return path
    }
}

struct CornerPipe: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        return path
    }
}

struct EndPipe: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addEllipse(in: CGRect(x: rect.midX - 8, y: rect.midY - 8, width: 16, height: 16))
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        return path
    }
}

struct TPipe: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        return path
    }
}

struct AnyShape: Shape {
    private let _path: @Sendable (CGRect) -> Path
    
    init<S: Shape>(_ shape: S) {
        _path = { rect in
            shape.path(in: rect)
        }
    }
    func path(in rect: CGRect) -> Path {
        _path(rect)
    }
}

#Preview {
    AugeanView(scene: .constant(.continueAugean))
}
