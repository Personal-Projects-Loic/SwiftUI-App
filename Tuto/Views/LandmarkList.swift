//
//  LandmarkList.swift
//  Tuto
//
//  Created by Loïc Rouzaud on 28/12/2023.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        List(landmarks, id: \.id) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

#Preview {
    LandmarkList()
}
