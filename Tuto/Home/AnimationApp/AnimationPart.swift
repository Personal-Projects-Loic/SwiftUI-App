
import SwiftUI

struct AnimationPart: View {
    var body: some View {
        VStack {
            HikeView(hike: ModelData().hikes[0])
                .padding()
            Spacer()
        }
    }
}

#Preview {
    AnimationPart()
}
