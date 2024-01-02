//
//  ContentView.swift
//  Animations
//
//  Created by vishwasai.karnati on 31/07/23.
//

import SwiftUI

struct ContentView: View {
//    @State private var animationAmount = 1.0
//    var body: some View {
//        Button("Tap Me") {
//            // do nothing
////            animationAmount+=1
//        }
//
//        .padding(50)
//        .background(.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//
////        .scaleEffect(animationAmount)
////        .blur(radius: (animationAmount - 1) * 1)
//        .overlay(
//            Circle()
//                .stroke(.red)
//                .scaleEffect(animationAmount)
//                .opacity(2 - animationAmount)
//                .animation(
//                           .easeOut(duration: 1)
//                               .repeatForever(autoreverses: false),
//                           value: animationAmount
//                       )
//        )
////        .animation(.easeOut, value: animationAmount)
////        .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
////        .animation(
////            .easeInOut(duration: 1)
////                .repeatCount(3, autoreverses: true),
////            value: animationAmount
////        )
//        .animation(
//            .easeInOut(duration: 1)
//                .repeatForever(autoreverses: true),
//            value: animationAmount
//        )
//        .onAppear {
//            animationAmount = 2
//        }
//    }
    
//     Binding to a value
//    @State private var animationAmount = 1.0
//
//      var body: some View {
//          VStack {
//              Stepper("Scale amount", value: $animationAmount.animation(.easeInOut(duration: 1)
//                .repeatCount(3, autoreverses: true)), in: 1...10)
//
//              Spacer()
//
//              Button("Tap Me") {
//                  animationAmount += 1
//              }
//              .padding(40)
//              .background(.red)
//              .foregroundColor(.white)
//              .clipShape(Circle())
//              .scaleEffect(animationAmount)
//          }
//      }
//    @State private var animationAmount = 0.0
//    var body: some View {
//            Button("Tap Me") {
//                // do nothing
//                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
//                    animationAmount += 360
//                }
//            }
//            .padding(50)
//            .background(.red)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
//        }
//    Animation modifier order
//    @State private var enabled = false
//    var body: some View{
//        Button("Tap Me") {
//            enabled.toggle()
//            // do nothing
//        }
//
//        .frame(width: 200, height: 200)
//        .background(enabled ? .blue : .red)
//        .animation(.default, value: enabled)
//        .foregroundColor(.white)
//        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
//
//        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
//
//
//    }
//    Animating Gestures
    
//    @State private var dragAmount = CGSize.zero
//    var body: some View {
//            LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                .frame(width: 300, height: 200)
//                .clipShape(RoundedRectangle(cornerRadius: 10))
//                .offset(dragAmount)
////                .animation(.spring(), value: dragAmount)
//                .gesture(
//                    DragGesture()
//                        .onChanged { dragAmount = $0.translation }
//                        .onEnded { _ in
//                            withAnimation(.spring()) {
//                                    dragAmount = .zero
//                                }
//                        }
//                )
////                .animation(.spring(), value: dragAmount)
//        }
    
//    let letters = Array("Hello SwiftUI")
//        @State private var enabled = false
//        @State private var dragAmount = CGSize.zero
//
//        var body: some View {
//            HStack(spacing: 0) {
//                ForEach(0..<letters.count, id: \.self) { num in
//                    Text(String(letters[num]))
//                        .padding(5)
//                        .font(.title)
//                        .background(enabled ? .blue : .red)
//                        .offset(dragAmount)
//                        .animation(.default.delay(Double(num) / 20), value: dragAmount)
//                }
//            }
//            .gesture(
//                DragGesture()
//                    .onChanged { dragAmount = $0.translation }
//                    .onEnded { _ in
//                        dragAmount = .zero
//                        enabled.toggle()
//                    }
//            )
//        }
//    Transitions
    @State private var isShowingRed = false
    var body: some View {
           VStack {
               Button("Tap Me") {
                   // do nothing
                   withAnimation{
                       isShowingRed.toggle()
                   }
               }

               if isShowingRed {
                   Rectangle()
                       .fill(.red)
                       .frame(width: 200, height: 200)
                       .transition(.pivot
                                   )
                   
               }
           }
       }
}
struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}
extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
