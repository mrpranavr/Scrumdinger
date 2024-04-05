//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Pranav R on 04/04/24.
//

import SwiftUI

struct DetailEditView: View {
    @State private var scrum = DailyScrum.emptyScrum
    @State private var newAttendeeName = ""
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info"), content: {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) min")
                        .accessibilityHidden(true)
                }
            })
            
            Section(content: {
                ForEach(scrum.attendees, content: { attendee in
                    Text(attendee.name)
                })
                .onDelete(perform: { indices in
                    scrum.attendees.remove(atOffsets: indices)
                })
                
                // New attendee adding here
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add Attendees")
                    })
                    .disabled(newAttendeeName.isEmpty)
                }
            }, header: {
                Text("Attendees")
            })
        }
    }
}

#Preview {
    DetailEditView()
}
