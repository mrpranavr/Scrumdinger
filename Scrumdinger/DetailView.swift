//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Pranav R on 30/03/24.
//

import SwiftUI

struct DetailView: View {
    @State private var isPresentingEditView = false
    
    let scrum : DailyScrum
    
    var body: some View {
        List(content: {
            Section(content: {
                NavigationLink(destination: MeetingView()) {
                    Label(
                        title: { Text("Start Meeting") },
                        icon: { Image(systemName: "timer") }
                    )
                        .font(.headline)
                    .foregroundColor(.accentColor)
                }
                
                HStack {
                    Label(
                        title: { Text("Length") },
                        icon: { Image(systemName: "clock") }
                    )
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                
                HStack {
                    Label(
                        title: { Text("Theme") },
                        icon: { Image(systemName: "paintpalette") }
                    )
                    Spacer()
                    Text("\(scrum.theme.name)")
                        .padding(6)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
                
            }, header: {
                Text("Meeting Info")
            })
            
            Section(content: {
                ForEach(scrum.attendees, content: { attendee in
                    Label(
                        title: { Text(attendee.name) },
                        icon: { Image(systemName: "person") }
                    )
                })
            }, header: {
                Text("Attendees")
            })
        })
        .navigationTitle(scrum.title)
        .toolbar(content: {
            Button(action: {
                isPresentingEditView = true
            }, label: {
                Text("Edit")
            })
        })
        .sheet(isPresented: $isPresentingEditView, content: {
            NavigationStack {
                DetailEditView()
                    .navigationTitle(scrum.title)
                    .toolbar(content: {
                        ToolbarItem(placement: .cancellationAction, content: {
                            Button(action: {
                                isPresentingEditView = false
                            }, label: {
                                Text("Cancel")
                            })
                        })
                        
                        // DONE Action
                        ToolbarItem(placement: .confirmationAction, content: {
                            Button(action: {
                                isPresentingEditView = false
                            }, label: {
                                Text("Done")
                            })
                        })
                    })
            }
        })
    }
}

#Preview {
    NavigationStack {
        DetailView(scrum: DailyScrum.sampleData[0])
    }
}
