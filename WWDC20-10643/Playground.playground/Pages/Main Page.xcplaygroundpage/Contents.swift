// WWDC20 Build a SwiftUI view
// in Swift Playgrounds
// WWDC20-10643

// This code is based on the code shown in
// the WWDC talk by the title above. Works in Xcode 11.5.

// open the left sidebar to view
// the ProgressView() implementation

import SwiftUI
import PlaygroundSupport

struct Preview: View {

    @State var progress = 0.0
    @State var increment = 0.05

    var body: some View {

        VStack(spacing: 30) {
            ProgressView(progress)
            ProgressView(progress)
                .environment(\.colorScheme, .dark)
            Button(action: incrementProgress) {
                Text("Increment Progress")
            }
        }
    .padding()
    .background(Color(UIColor.secondarySystemBackground))
    }

    func incrementProgress() {
        if progress < 0.995 {
            progress += increment
        }
    }

}

// Present the view controller in the Live View window
PlaygroundPage.current.setLiveView(Preview())

