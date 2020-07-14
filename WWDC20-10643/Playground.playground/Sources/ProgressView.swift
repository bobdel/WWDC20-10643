import SwiftUI


public struct ProgressView: View {

    let gradientColors: [Color] = [Color(#colorLiteral(red: 0.7450980392156863, green: 0.1568627450980392, blue: 0.07450980392156863, alpha: 1.0)),Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))]
    let sliceSize = 0.35
    var progress: Double


    private let percentageFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        return formatter
    }()

    public init(_ progress: Double = 0.3) {
        self.progress = progress
    }

    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                Group {
                    Circle()
                        .trim(from: 0, to: 1 - CGFloat(self.sliceSize))
                        .stroke(self.strokeGradient,
                                style: self.strokeStyle(with: geometry))
                        .opacity(0.5)
                    Circle()
                        .trim(from: 0, to:  (1 - CGFloat(self.sliceSize)) * CGFloat(self.progress))
                        .stroke(self.strokeGradient,
                                style: self.strokeStyle(with: geometry))
                }.rotationEffect(.degrees(90) + .degrees(360 * self.sliceSize / 2 ))

                if self.progress > 0.995 {
                    Image(systemName: "star.fill")
                        .font(.system(size: 0.4 * min(geometry.size.width,geometry.size.height),weight: .bold, design: .rounded))
                        .foregroundColor(Color.yellow)
                        .offset(y: -0.05 * min(geometry.size.width,geometry.size.height))
                        .animation(nil)
                } else {
                    Text(self.percentageFormatter.string(from: self.progress as NSNumber)!)
                        .font(.system(size: 0.3 * min(geometry.size.width, geometry.size.height), weight: .bold, design: .rounded))
                        .offset(y: -0.05 * min(geometry.size.width,geometry.size.height))
                        .animation(nil)
                }
            }
            .offset(y: 0.1 * min(geometry.size.width,geometry.size.height))
        }
        .padding(40)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(20)

    }

    private var strokeGradient: AngularGradient {
        return AngularGradient(gradient: Gradient(colors: self.gradientColors), center: .center, angle: .degrees(-10))
    }

    private func strokeStyle(with geometry: GeometryProxy) -> StrokeStyle {
        return StrokeStyle(lineWidth: 0.12 * min(geometry.size.width, geometry.size.height), lineCap: .round)
    }

}


