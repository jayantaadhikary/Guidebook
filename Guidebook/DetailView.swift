//
//  DetailView.swift
//  Guidebook
//
//  Created by Jayanta Adhikary on 28/07/23.
//

import SwiftUI

struct DetailView: View {
    
    var attraction: Attraction
    
    var body: some View {
        
        VStack(spacing: 20){
            Image(attraction.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height:300)
            
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading, spacing: 20){
                    Text(attraction.name)
                        .font(.title)
                        .bold()
                    Text(attraction.longDescription)
                        .multilineTextAlignment(.leading)
                    
                    //Create url instance based on url scheme
                    if let url = URL(string: "maps://?q=\(cleanName(name: attraction.name))&sll=\(cleanAttractionCoords(latLong: attraction.latLong))&z=10&t=s"){
                        //Test if url can be opened
                        if UIApplication.shared.canOpenURL(url) {
                            Button {
                                UIApplication.shared.open(url)
                                
                            } label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(.blue)
                                        .frame(height: 40)
                                    Text("Get Directions")
                                        .foregroundColor(.white)
                                }
                            }
                            
                        }
                        
                       
                    }
                    
                    
                    
                    
                }
                .padding(.bottom, 20)
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea()
        
        
        
    }
    
    func cleanName(name: String) -> String{
        return name.replacingOccurrences(of: " ", with: "").folding(options: .diacriticInsensitive, locale: .current)
    }
    func cleanAttractionCoords(latLong: String) -> String{
        return latLong.replacingOccurrences(of: " ", with: "")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(attraction: Attraction(name: "Louvre Museum",
                                          summary: "The Louvre, or the Louvre Museum is a national art museum in Paris, France.",
                                          longDescription: """
       The Louvre or the Louvre Museum is a national art museum in Paris, France. A central landmark of the city, it is located on the Right Bank of the Seine in the city's 1st arrondissement (district or ward) and home to some of the most canonical works of Western art, including the Mona Lisa and the Venus de Milo. The museum is housed in the Louvre Palace, originally built in the late 12th to 13th century under Philip II. Remnants of the Medieval Louvre fortress are visible in the basement of the museum. Due to urban expansion, the fortress eventually lost its defensive function, and in 1546 Francis I converted it into the primary residence of the French Kings.
       """,
                                          imageName: "louvre", latLong: "48.860752239687095, 2.337686912770478"))
    }
}
