//
//  ContentView.swift
//  Drawing
//
//  Created by vishwasai.karnati on 14/08/23.
////
//
import SwiftUI

//SpiroGraph
//struct Spirograph: Shape {
//    func path(in rect: CGRect) -> Path {
//        let divisor = gcd(innerRadius, outerRadius)
//           let outerRadius = Double(self.outerRadius)
//           let innerRadius = Double(self.innerRadius)
//           let distance = Double(self.distance)
//           let difference = innerRadius - outerRadius
//           let endPoint = ceil(2 * Double.pi * outerRadius / Double(divisor)) * amount
//        var path = Path()
//
//        for theta in stride(from: 0, through: endPoint, by: 0.01) {
//            var x = difference * cos(theta) + distance * cos(difference / outerRadius * theta)
//            var y = difference * sin(theta) - distance * sin(difference / outerRadius * theta)
//
//            x += rect.width / 2
//            y += rect.height / 2
//
//            if theta == 0 {
//                path.move(to: CGPoint(x: x, y: y))
//            } else {
//                path.addLine(to: CGPoint(x: x, y: y))
//            }
//        }
//
//        return path
//    }
//
//    let innerRadius: Int
//    let outerRadius: Int
//    let distance: Int
//    let amount: Double
//    func gcd(_ a: Int, _ b: Int) -> Int {
//        var a = a
//        var b = b
//
//        while b != 0 {
//            let temp = b
//            b = a % b
//            a = temp
//        }
//
//        return a
//    }
//}
//struct ContentView: View {
//    @State private var innerRadius = 125.0
//    @State private var outerRadius = 75.0
//    @State private var distance = 25.0
//    @State private var amount = 1.0
//    @State private var hue = 0.6
//
//    var body: some View {
//        VStack(spacing: 0) {
//            Spacer()
//
//            Spirograph(innerRadius: Int(innerRadius), outerRadius: Int(outerRadius), distance: Int(distance), amount: amount)
//                .stroke(Color(hue: hue, saturation: 1, brightness: 1), lineWidth: 1)
//                .frame(width: 300, height: 300)
//
//            Spacer()
//
//            Group {
//                Text("Inner radius: \(Int(innerRadius))")
//                Slider(value: $innerRadius, in: 10...150, step: 1)
//                    .padding([.horizontal, .bottom])
//
//                Text("Outer radius: \(Int(outerRadius))")
//                Slider(value: $outerRadius, in: 10...150, step: 1)
//                    .padding([.horizontal, .bottom])
//
//                Text("Distance: \(Int(distance))")
//                Slider(value: $distance, in: 1...150, step: 1)
//                    .padding([.horizontal, .bottom])
//
//                Text("Amount: \(amount, format: .number.precision(.fractionLength(2)))")
//                Slider(value: $amount)
//                    .padding([.horizontal, .bottom])
//
//                Text("Color")
//                Slider(value: $hue)
//                    .padding(.horizontal)
//            }
//        }
//    }
//}
//
////struct ContentView: View {
////
////    @State private var colorCycle = 0.0
////
////       var body: some View {
////           VStack {
////               ColorCyclingCircle(amount: colorCycle)
////                   .frame(width: 300, height: 300)
////
////               Slider(value: $colorCycle)
////           }
////       }
////}
//
//
////struct ContentView: View {
////    @State private var amount = 0.0
////
////    var body: some View {
////        VStack {
////            ZStack {
////                Circle()
////                    .fill(.red)
////                    .frame(width: 200 * amount)
////                    .offset(x: -50, y: -80)
////                    .blendMode(.screen)
////
////                Circle()
////                    .fill(.green)
////                    .frame(width: 200 * amount)
////                    .offset(x: 50, y: -80)
////                    .blendMode(.screen)
////
////                Circle()
////                    .fill(.blue)
////                    .frame(width: 200 * amount)
////                    .blendMode(.screen)
////            }
////            .frame(width: 300, height: 300)
////
////            Slider(value: $amount)
////                .padding()
////        }
////        .frame(maxWidth: .infinity, maxHeight: .infinity)
////        .background(.black)
////        .ignoresSafeArea()
////    }
////}
//////struct ColorCyclingCircle: View {
////    var amount = 0.0
////    var steps = 100
////
////    var body: some View {
////        ZStack {
////            ForEach(0..<steps) { value in
////                Circle()
////                    .inset(by: Double(value))
////                    .strokeBorder(
////                        LinearGradient(
////                            gradient: Gradient(colors: [
////                                color(for: value, brightness: 1),
////                                color(for: value, brightness: 0.5)
////                            ]),
////                            startPoint: .top,
////                            endPoint: .bottom
////                        ),
////                        lineWidth: 2
////                    )
////            }
////        }
////        .drawingGroup()
////    }
////
////    func color(for value: Int, brightness: Double) -> Color {
////        var targetHue = Double(value) / Double(steps) + amount
////
////        if targetHue > 1 {
////            targetHue -= 1
////        }
////
////        return Color(hue: targetHue, saturation: 1, brightness: brightness)
////    }
////}
//
//
////    Ellipses
//
////    @State private var petalOffset = -20.0
////        @State private var petalWidth = 100.0
////
////        var body: some View {
////            VStack {
////                Flower(petalOffset: petalOffset, petalWidth: petalWidth)
////                    .fill(.red, style: FillStyle(eoFill: true))
//////                    .stroke(.red, lineWidth: 1)
//////                    .fill(.red)
////
////                Text("Offset")
////                Slider(value: $petalOffset, in: -40...40)
////                    .padding([.horizontal, .bottom])
////
////                Text("Width")
////                Slider(value: $petalWidth, in: 0...100)
////                    .padding(.horizontal)
////
////                Text("Hello World")
////                    .frame(width: 300, height: 300)
////                    .border(ImagePaint(image: Image("appIcon"), scale: 0.2), width: 30)
////            }
////        }
////    var body: some View {
////        VStack {
//////            Circle()
//////                     .strokeBorder(.blue, lineWidth: 40)
//////             }
////            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
////                .stroke(.blue, lineWidth: 10)
////                .frame(width: 300, height: 300)
////            //            Image(systemName: "globe")
////            //                .imageScale(.large)
////            //                .foregroundColor(.accentColor)
////            //            Text("Hello, world!")
////            //            Path { path in
////            //                path.move(to: CGPoint(x: 200, y: 100))
////            //                path.addLine(to: CGPoint(x: 100, y: 300))
////            //                path.addLine(to: CGPoint(x: 300, y: 300))
////            //                path.addLine(to: CGPoint(x: 200, y: 100))
////            ////                path.closeSubpath()
////            //            }
////            ////            .stroke(.blue, lineWidth: 10)
////            //            .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
////            //
////                    }
////            //        .padding()
////        }
//
//
//struct Flower: Shape {
//    // How much to move this petal away from the center
//    var petalOffset: Double = -20
//
//    // How wide to make each petal
//    var petalWidth: Double = 100
//
//    func path(in rect: CGRect) -> Path {
//        // The path that will hold all petals
//        var path = Path()
//
//        // Count from 0 up to pi * 2, moving up pi / 8 each time
//        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
//            // rotate the petal by the current value of our loop
//            let rotation = CGAffineTransform(rotationAngle: number)
//
//            // move the petal to be at the center of our view
//            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
//
//            // create a path for this petal using our properties plus a fixed Y and height
//            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
//
//            // apply our rotation/position transformation to the petal
//            let rotatedPetal = originalPetal.applying(position)
//
//            // add it to our main path
//            path.addPath(rotatedPetal)
//        }
//
//        // now send the main path back
//        return path
//    }
//}
//
//
//struct Trapezoid: Shape {
//    var insetAmount: Double
//    var animatableData: Double {
//        get { insetAmount }
//        set { insetAmount = newValue }
//    }
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        path.move(to: CGPoint(x: 0, y: rect.maxY))
//        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
//
//        return path
//   }
//}
//struct ContentView: View {
//    @State private var insetAmount = 50.0
//
//    var body: some View {
//        Trapezoid(insetAmount: insetAmount)
//            .frame(width: 200, height: 100)
//            .onTapGesture {
//                withAnimation{
//                    insetAmount = Double.random(in: 10...90)
//                }
//            }
//    }
//}
////Drawin g ARCCS
//struct Arc: Shape {
//    var startAngle: Angle
//        var endAngle: Angle
//        var clockwise: Bool
//
//    func path(in rect: CGRect) -> Path {
//        let rotationAdjustment = Angle.degrees(90)
//            let modifiedStart = startAngle - rotationAdjustment
//            let modifiedEnd = endAngle - rotationAdjustment
//
//        var path = Path()
////        var path = Path()
//            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
//
//            return path
////        return path
//    }
//}

//struct ContentView:View{
//
//    @State var thickness=30.0
//    var body: some View{
//       Arrow(thickness: thickness)
//            .frame(width: 300, height: 300)
//            .onTapGesture {
//                           withAnimation{
//                               thickness = Double.random(in: 10...90)
//                           }
//                       }
//    }
//
//
//}
//struct Arrow:Shape{
//    var thickness:Double
//    var animatableData: Double{
//        get{thickness}
//        set{thickness=newValue}
//    }
//    func path(in rect: CGRect) -> Path {
//        var path=Path()
////        var path = Path()
//
//        path.move(to: CGPoint(x: rect.midX, y: 0))
//                   path.addLine(to: CGPoint(x: rect.minX+thickness, y: rect.midY))
//                   path.addLine(to: CGPoint(x: rect.midX - thickness, y: rect.midY ))
//                   path.addLine(to: CGPoint(x: rect.midX - thickness, y: rect.maxY))
//                   path.addLine(to: CGPoint(x: rect.midX + thickness, y: rect.maxY))
//                   path.addLine(to: CGPoint(x: rect.midX + thickness, y: rect.midY))
//        path.addLine(to: CGPoint(x: rect.maxX-thickness, y: rect.midY))
////                   path.addLine(to: CGPoint(x: 0, y: rect.minY))
//                   path.closeSubpath()
//
////               return path
//        return path
//    }
//
//
//}
struct ContentView: View {

    @State private var colorCycle = 0.0
       @State var gradientStartX = 0.5
       @State var gradientStartY = 0.0
       @State var gradientEndX = 0.5
       @State var gradientEndY = 1.0
       var body: some View {
           VStack {
               ColorCyclingRectangle(amount: colorCycle)
                   .frame(width: 300, height: 300)
               HStack {
                              Text("Color")
                              Slider(value: $colorCycle)
                          }
                          
                          HStack {
                              Text("Start X")
                              Slider(value: $gradientStartX)
                          }
                          
                          HStack {
                              Text("Start Y")
                              Slider(value: $gradientStartY)
                          }
                          
                          HStack {
                              Text("End X")
                              Slider(value: $gradientEndX)
                          }
                          
                          HStack {
                              Text("End Y")
                              Slider(value: $gradientEndY)
                          }
           }
       }
}
struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    var gradientStartX = 0.5
        var gradientStartY = 0.0
        
        var gradientEndX = 0.5
        var gradientEndY = 1.0
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: UnitPoint(x: gradientStartX, y: gradientStartY),
                                                       endPoint: UnitPoint(x: gradientEndX, y: gradientEndY)
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
