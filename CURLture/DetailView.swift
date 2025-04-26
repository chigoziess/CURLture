//
//  DetailView.swift
//  CURLture
//
//  Created by Chigozie Sumani on 4/22/25.
//

import SwiftUI
import SwiftData
import AVFAudio

struct DetailView: View {
    @State var hairProfile: HairProfile
    @State private var hairType = ""
    @State private var porosity = ""
    @State private var descriptionText = ""
    @State private var products = ""
    @State private var notes = ""
    @State private var dateAdded = Date()
    @State private var audioPlayer: AVAudioPlayer!
    let hairTypes = ["1A", "1B", "1C", "2A", "2B", "2C", "3A", "3B", "3C", "4A", "4B", "4C"]
    let porosityOptions = ["Low", "High"]
    @State private var imageName = ""
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        
            VStack(alignment: .leading) {
                HStack {
                    Text("Hair Type:")
                        .foregroundStyle(.accent)
                        .font(.title3)
                        .bold()
                    
                    Picker("Hair Type", selection: $hairType) {
                        ForEach(hairTypes, id: \.self) { type in
                            Text(type)
                        }
                    }
                    .fontWeight(.light)
                    .onChange(of: hairType) {
                        if hairType.contains("4") {
                            imageName = "Type4"
                        } else if hairType.contains("3") {
                            imageName = "Type3"
                        } else if hairType.contains("2") {
                            imageName = "Type2"
                        } else if hairType.contains("1") {
                            imageName = "Type1"
                        } else {
                            descriptionText = ""
                        }
                    }
                    if !imageName.isEmpty {
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .padding(.leading, 8)
                        }
                }
                
                    .onChange(of: hairType) {
                        if hairType.contains("4") {
                            descriptionText = "Type 4 hair features the tightest curls or coils and can appear dense, soft, or wiry depending on the individual. This hair type experiences the most shrinkage and is the most fragile, making gentle handling and deep hydration essential. Type 4 hair craves rich creams, oils, and protective styles to retain moisture and prevent breakage. No matter the subtype (A to C), each level reflects how fine or coarse your hair is, with 4A being defined coils and 4C being tightly packed, zigzag strands with minimal definition. Whether your hair has high or low porosity will impact how easily it absorbs moisture—high porosity drinks up product quickly, while low porosity resists moisture and takes longer to dry."
                        } else if hairType.contains("3") {
                            descriptionText = "Type 3 hair has a clear, defined curl pattern that ranges from loose spirals to springy ringlets. This hair type is full of body and movement but can easily become dry, frizzy, or tangled without the right care. It thrives with moisture-rich products that define curls and minimize shrinkage. No matter the subtype (A to C), each level reflects how fine or coarse your hair is, with 3A being looser curls and 3C being tighter corkscrews. Whether your hair has high or low porosity will impact how easily it absorbs moisture—high porosity drinks up product quickly, while low porosity resists moisture and takes longer to dry."
                        } else if hairType.contains("2") {
                            descriptionText = "Type 2 hair falls somewhere between straight and curly, with a natural wave that forms an “S” shape. It usually has more volume than Type 1 and can range from loose beachy waves to more defined ones. While it’s often easy to style, it can be prone to frizz, especially in humid climates. No matter the subtype (A to C), each level reflects how fine or coarse your hair is, with 2A being the loosest and 2C having more texture and body. Whether your hair has high or low porosity will impact how easily it absorbs moisture—high porosity drinks up product quickly, while low porosity resists moisture and takes longer to dry."
                        } else if hairType.contains("1") {
                            descriptionText = "Type 1 hair is naturally straight and often the most resistant to curling. It tends to get oily faster than other types because the natural oils from the scalp travel down the strands easily. Type 1 hair is usually shiny and smooth, but it can lack volume or texture. No matter the subtype (A to C), each level reflects how fine or coarse your hair is, with 1A being the finest and 1C being the thickest.Whether your hair has high or low porosity will impact how easily it absorbs moisture—high porosity drinks up product quickly, while low porosity resists moisture and takes longer to dry."
                        } else {
                            descriptionText = ""
                        }
                    }
                
                    
                    
                
                
                HStack {
                    Text("Porosity:")
                    .foregroundStyle(.accent)
                    .font(.title3)
                    .bold()
                    Picker("Porosity", selection: $porosity) {
                        ForEach(porosityOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                    .fontWeight(.light)
                    .frame(height: 40)
                }
                
               
                Text("About Your Hair:")
                    .foregroundStyle(.accent)
                    .font(.custom("Snell Roundhand", size: 27))
                    .bold()
                ScrollView {
                    Text(descriptionText)
                        .textFieldStyle(.roundedBorder)
                        .font(.title2)
                        .fontWeight(.light)
                }
            
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                Text("Products Used:")
                    .foregroundStyle(.accent)
                    .font(.title3)
                    .bold()
                TextField("products used", text: $products, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .font(.title2)
                    .fontWeight(.light)
                    .frame(height: 50)
                
                Text("Routines that Worked/Notes:")
                    .foregroundStyle(.accent)
                    .font(.title3)
                    .bold()
                TextField("routines that worked", text: $notes, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.leading)
                    .font(.title2)
                    .fontWeight(.light)
                    .frame(height: 60)

                DatePicker("Date Added:", selection: $dateAdded, displayedComponents: .date)
                    .datePickerStyle(.compact)
                    .foregroundStyle(.accent)
                    .font(.title3)
                    .bold()
            }
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .tint(.teal)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        if notes.isEmpty {
                            notes = "n/a"
                        }
                        hairProfile.hairType = hairType
                        hairProfile.porosity = porosity
                        hairProfile.descriptionText = descriptionText
                        hairProfile.products = products
                        hairProfile.notes = notes
                        hairProfile.dateAdded = dateAdded
                        modelContext.insert(hairProfile)
                        guard let _ = try? modelContext.save() else {
                            return
                        }
                        dismiss()
                    }
                    .tint(.teal)
                }
            }
            .padding()
            .onAppear {
                hairType = hairProfile.hairType
                porosity = hairProfile.porosity
                descriptionText = hairProfile.descriptionText
                products = hairProfile.products
                notes = hairProfile.notes
                dateAdded = hairProfile.dateAdded
            }
       
    }
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("ERROR!")
        }
    }
}


#Preview {
    NavigationStack {
        DetailView(hairProfile: HairProfile(hairType: "", porosity: "", descriptionText: "", products: "", notes: "")).modelContainer(for: HairProfile.self, inMemory: true)
    }
    .padding()
}
