//
//  ListView.swift
//  CURLture
//
//  Created by Chigozie Sumani on 4/22/25.
//

import SwiftUI
import SwiftData

struct ListView: View {
    @Query var hairProfiles: [HairProfile]
    @State private var sheetIsPresented = false
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(hairProfiles) {hairProfile in
                    NavigationLink {
                        DetailView(hairProfile: hairProfile)
                    } label: {
                        VStack {
                            HStack {
                                
                                Text("Date Added: \n\(hairProfile.dateAdded.formatted(.dateTime.month().day().year()))")
                                    .font(.title3)
                                    .foregroundStyle(.accent)
                                    .frame(maxWidth: 120, maxHeight: 60)
                                Spacer()
                                Text("Notes: \(hairProfile.notes)")
                                    .font(.title3)
                                    .fontWeight(.light)
                                    .foregroundStyle(.secondary)
                                    .frame(maxWidth: 185, maxHeight: 120)
                            }
                            .padding()
                        }
                        .swipeActions {
                            Button("Delete", role:.destructive) {
                                modelContext.delete(hairProfile)
                                guard let _ = try? modelContext.save() else {
                                    return
                                }
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Hair Profile")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailView(hairProfile: HairProfile(
                        hairType: "",
                        porosity: "",
                        descriptionText: "",
                        products: "",
                        notes: "",
                        dateAdded: Date()
                    ))
                }
            }
        }
    }
}

#Preview {
    ListView()
        .modelContainer(HairProfile.preview)
}

