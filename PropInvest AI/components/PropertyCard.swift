//
//  PropertyCard.swift
//  PropInvest AI
//
//  Created by Danilo Urrutia on 2/9/26.
//

import SwiftUI

struct PropertyCard: View {
    let property: Property

    var body: some View {
        VStack(spacing: 8) {
            ZStack(alignment: .topLeading) {
                AsyncImage(url: URL(string: property.main_pic)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                    } else if phase.error != nil {
                        Image(systemName: "house.fill")
                            .resizable()
                            .scaledToFit()
                            .padding(40)
                            .foregroundColor(.gray.opacity(0.6))
                            .background(Color(.gray))
                    } else {
                        ProgressView()
                    }
                }
                .frame(height: 120)
                .clipped()
                .clipShape(.rect(topLeadingRadius: 12, topTrailingRadius: 12))
                
                HStack {
                    PropertyStatusWidget(propertyStatus: property.status)

                }
                .padding(8)
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(formattedPrice(property.price))
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(formattedAddress)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack(spacing: 24) {
                    Label("\(property.bed) Beds", systemImage: "bed.double.fill")
                    Label("\(formattedBaths) Baths", systemImage: "bathtub.fill")
                    Label("\(formattedFloorArea)", systemImage: "ruler.fill")
                }
                .font(.footnote)
                .foregroundColor(.secondary)
            }
            .padding(.horizontal, 12)
            
            Button {
                // View details action
            } label: {
                Text("View Details & Analysis")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(Capsule().fill(Color.blue))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 12)
        }
        .cornerRadius(16)
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
    }

    private var formattedAddress: String {
        "\(property.address), \(property.city)"
    }

    private var formattedBaths: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        return formatter.string(from: NSNumber(value: property.bath)) ?? "\(property.bath)"
    }

    private var formattedFloorArea: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        let value = NSNumber(value: property.floor)
        let formatted = formatter.string(from: value) ?? "\(property.floor)"
        return "\(formatted) sqft"
    }

    private func formattedPrice(_ price: Float) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: price)) ?? "\(price)"
    }
}

struct PropertyCard_Previews: PreviewProvider {
    private static let sampleProperty = Property(
        id: "1",
        title: "Modern Family Home",
        address: "123 Maple Street",
        city: "Springfield",
        state: "IL",
        zip: "62704",
        status: 0,
        bed: "4",
        bath: 3.0,
        price: 485000,
        type: "Single Family",
        land: 0,
        floor: 2340,
        level: 2,
        description: "Spacious home with updated kitchen and large backyard.",
        location: Location(lon: -89.6501, lat: 39.7817),
        pics: [],
        main_pic: "https://images.unsplash.com/photo-1512917774080-9991f1c4c750"
    )

    static var previews: some View {
        VStack(spacing: 0) {
            PropertyCard(property: sampleProperty)
            PropertyCard(property: sampleProperty)
        }
        .frame(width: 360)
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.light)
    }
}

