//
//  PlaceListView.swift
//  MapView
//
//  Created by Ваня Науменко on 12.04.23.
//

import MapKit
import SwiftUI

// MARK: - PlaceListView

struct PlaceListView: View {
    let landmarks: [Landmark]
    var onTap: () -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                EmptyView()
            }.frame(width: UIScreen.main.bounds.size.width, height: 60)
                .background(Color.gray)
                .gesture(TapGesture().onEnded(self.onTap))
            List {
                ForEach(self.landmarks, id: \.id) { landmark in
                    /*@START_MENU_TOKEN@*/Text(landmark.name)/*@END_MENU_TOKEN@*/
                        .fontWeight(.bold)
                    
                    Text(landmark.titlle)
                }
            }.animation(nil)
        }.cornerRadius(10)    }
}

// MARK: - PlaceListView_Previews

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView(landmarks: [Landmark].init(), onTap: {})
    }
}
