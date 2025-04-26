//
//  HairProfile.swift
//  CURLture
//
//  Created by Chigozie Sumani on 4/22/25.
//

import Foundation
import SwiftData

@Model
class HairProfile {
    var hairType: String
    var porosity: String
    var descriptionText: String
    var products: String
    var notes: String
    var dateAdded: Date
    
    init(hairType: String, porosity: String, descriptionText: String, products: String, notes: String, dateAdded: Date = Date()) {
        self.hairType = hairType
        self.porosity = porosity
        self.descriptionText = descriptionText
        self.products = products
        self.notes = notes
        self.dateAdded = dateAdded
    }
}

extension HairProfile {
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: HairProfile.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        Task { @MainActor in
            container.mainContext.insert(HairProfile(hairType: "4C", porosity: "high", descriptionText: "4C hair is the tightest and most delicate curl pattern, characterized by densely packed strands that form a zigzag shape with little to no defined curl. It tends to shrink up to 75% of its actual length and is highly prone to dryness, tangling, and breakage if not properly cared for. This hair type craves consistent moisture, gentle manipulation, and protective styling to maintain its health and retain length. It often thrives with a routine focused on deep conditioning, sealing with oils or butters, and minimizing heat.", products: "Sulfate-free moisturizing shampoo", notes: "The season right now is making my hair dry.", dateAdded: Date()))
            container.mainContext.insert(HairProfile(hairType: "4B", porosity: "low", descriptionText: "4B hair has a soft, fluffy texture with less defined curls that resemble a Z-shape or sharp angles. While it is dense and voluminous, it doesn’t form ringlets naturally and is highly porous, making it prone to absorbing and quickly losing moisture. 4B strands are fragile and can shrink significantly, requiring low-manipulation styles and consistent hydration. Stretching techniques (like braids or twist-outs) help reduce tangling and make it easier to manage. It responds well to rich creams and leave-ins that lock in moisture.", products: "Gentle sulfate-free hydrating shampoo", notes: "This shampoo worked well for me.", dateAdded: Date()))
            container.mainContext.insert(HairProfile(hairType: "4A", porosity: "high", descriptionText: "4A hair features well-defined, springy coils with a visible S-pattern and natural sheen. It retains moisture better than 4B and 4C hair but still requires regular hydration to stay soft and manageable. 4A hair is versatile—it responds well to curl creams and gels for wash-and-go styles but can also be prone to frizz if not sealed properly. This hair type typically shrinks 40–60% and benefits from lightweight products that enhance definition without weighing the curls down. Finger detangling or using wide-tooth combs can preserve its curl pattern.", products: "Curl-enhancing moisturizing shampoo", notes: "I barely lost hair during my wash.", dateAdded: Date()))
            container.mainContext.insert(HairProfile(hairType: "3C", porosity: "low", descriptionText: "3C hair consists of tight corkscrew curls that are densely packed and naturally voluminous. The curl pattern is clearly defined with a mix of textures that range from fine to coarse. While 3C hair holds its shape well, it is often prone to frizz, dryness, and tangling due to its density. It responds well to light but nourishing products that enhance definition while maintaining bounce. Regular detangling, deep conditioning, and hydration-focused routines help keep the curls shiny and healthy. Protective styles can help reduce manipulation and retain length.", products: "Lightweight, curl-safe shampoo", notes: "A little of this product went a long way", dateAdded: Date()))
        }
        return container
    }
}

