//
//  AttractionView.swift
//  Guidebook
//
//  Created by Jayanta Adhikary on 28/07/23.
//

import SwiftUI

struct AttractionView: View {
    
    var city: City
    
    var body: some View {
        
        ScrollView{
            VStack{
                ForEach(city.attractions){ attraction in
                    NavigationLink {
                        DetailView(attraction: attraction)
                    } label: {
                        AttractionRow(attraction: attraction)
                            .padding(.bottom, 50)
                    }
                    .buttonStyle(.plain)

                }
            }
        }
        .padding(.horizontal)
    }
}

struct AttractionView_Previews: PreviewProvider {
    static var previews: some View {
        AttractionView(city: City(name: "Paris",
                                  summary: "Paris, France's capital, is a major European city and a global center for art, fashion, gastronomy and culture. Its 19th-century cityscape is crisscrossed by wide boulevards and the River Seine.",
                                  imageName: "paris",
                                  attractions: [
                                     Attraction(name: "Louvre Museum",
                                                summary: "The Louvre, or the Louvre Museum is a national art museum in Paris, France.",
                                                longDescription: """
             The Louvre or the Louvre Museum is a national art museum in Paris, France. A central landmark of the city, it is located on the Right Bank of the Seine in the city's 1st arrondissement (district or ward) and home to some of the most canonical works of Western art, including the Mona Lisa and the Venus de Milo. The museum is housed in the Louvre Palace, originally built in the late 12th to 13th century under Philip II. Remnants of the Medieval Louvre fortress are visible in the basement of the museum. Due to urban expansion, the fortress eventually lost its defensive function, and in 1546 Francis I converted it into the primary residence of the French Kings.
             """,
                                                imageName: "louvre", latLong: "48.860752239687095, 2.337686912770478")
                                  ]))
    }
}
