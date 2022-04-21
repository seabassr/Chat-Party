//
//  ColorChoice.swift
//  Chat Party
//
//  Created by Sebastian Rodriguez on 4/11/22.
//

import SwiftUI

struct ColorChoice: View {
    @EnvironmentObject var profile: Profile
    let colorCode: [[Double]] = [[0.0, 0.0, 0.0], [0.0, 0.6, 1.0], [1.0, 0.5, 1.0],
                                [0.6, 0.3, 1.0], [1.0, 0.0, 0.5], [1.0, 0.5, 0.0], [0.5, 0.9, 0.3]]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(colorCode, id: \.self) { i in
                    Button(action: {
                        profile.items.colorR = i[0]
                        profile.items.colorG = i[1]
                        profile.items.colorB = i[2]
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(red: i[0], green: i[1], blue: i[2]))
                            .frame(width: 50, height: 50)
                    })
                }
            }
            .padding([.trailing, .leading])
        }
    }
}

struct ColorChoice_Previews: PreviewProvider {
    static var previews: some View {
        ColorChoice()
            .environmentObject(Profile())
    }
}
