//
//  CardView.swift
//  Scrumdinger
//
//  Created by Pranav R on 30/03/24.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(/*@START_MENU_TOKEN@*/.isHeader/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack {
                Label(
                    title: { Text("\(scrum.attendees.count)") },
                    icon: { Image(systemName: "person.3") }
                ).accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label(
                    title: { Text("\(scrum.lengthInMinutes)") },
                    icon: { Image(systemName: "clock") }
                )
                .accessibilityLabel("\(scrum.lengthInMinutes) minutes meeting")
                .labelStyle(.trailingIcon)
            }.font(.caption)
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.sampleData[0]
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
