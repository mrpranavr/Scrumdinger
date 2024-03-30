//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Pranav R on 30/03/24.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed").font(.caption)
                    Label(
                        title: { Text("300") },
                        icon: { Image(systemName: "hourglass.tophalf.fill") }
                    )
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining").font(.caption)
                    Label(
                        title: { Text("600") },
                        icon: { Image(systemName: "hourglass.bottomhalf.fill") }
                    )
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time Remaining")
            .accessibilityValue("10 Minutes")
            Circle()
                .strokeBorder(lineWidth: 24)
            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "forward.fill")
                })
            }.accessibilityLabel("Next Speaker")
        }.padding()
    }
}

#Preview {
    MeetingView()
}
