//
//  ContentView.swift
//  swift-radar-snippet
//
//  Created by Manoj Elango on 4/8/25.
//
import SwiftUI

struct ContentView: View {
    @State private var rotate = false
    
    
    
    var body: some View {
        ZStack {
            // Draw concentric circles with decreasing opacity
            Circle()
                .stroke(Color.white.opacity(1), lineWidth: 5)
                .frame(width: 5, height: 5)
            
            Circle()
                .stroke(Color.white.opacity(0.5), lineWidth: 1)
                .frame(width: 100, height: 100)
            Circle()
                .stroke(Color.white.opacity(0.3), lineWidth: 1)
                .frame(width: 200, height: 200)
            Circle()
                .stroke(Color.white.opacity(0.1), lineWidth: 1)
                .frame(width: 300, height: 300)
            Circle()
                .stroke(Color.white.opacity(0.1), lineWidth: 1)
                .frame(width: 315, height: 315)
            
            // Draw the rotating line
            Line(point0: CGPoint(x: 0.5, y: 0.5), point1: CGPoint(x: 0.5, y: 0))
                .stroke(Color.white, lineWidth: 2)
                .frame(width: 200, height: 300)
                .rotationEffect(.degrees(rotate ? 360 : 0), anchor: .center)
                .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false))
                .onAppear {
                    self.rotate.toggle()
                }
            
        }
    }
    
    
}

struct Line: Shape {
    var point0: CGPoint = CGPoint(x: 0.0, y: 1.0)
    var point1: CGPoint = CGPoint(x: 1.0, y: 0.0)
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: point0.x * rect.width, y: point0.y * rect.height))
            path.addLine(to: CGPoint(x: point1.x * rect.width, y: point1.y * rect.height))
        }
    }
}

#Preview {
    ContentView()
        .background(.black)
}
