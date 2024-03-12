//
//  ListingDetailView.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/12/24.
//

import SwiftUI

struct ListingDetailView: View {
    var body: some View {
        ScrollView {
            ListingImageCarouselView()
                .frame(height: 320)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                        Text("4.86")
                        Text(" - ")
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    } //HStack
                    .foregroundStyle(.black)
                    
                    Text("Miami, Florida")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
            
            HStack {
                VStack {
                    Text("Entire villa hosted by Jhon Smith")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    
                    HStack {
                        Text(" 4 guests -")
                        Text(" 4 bedrooms -")
                        Text(" 4 beds -")
                        Text(" 3 baths -")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                Spacer()
                
                Image(systemName: "book.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                ForEach(0..<2) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: "medal")
                        
                        VStack(alignment: .leading) {
                            Text("Superhost")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Superhosts are experience, highly rated hosts who are commited to providing great stars for guests")
                        }
                    }
                }
            }
            .padding()
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("where you'll sleep")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(1..<5) { bedroom in
                            VStack(alignment: .leading) {
                                Image(systemName: "bed.double")
                                
                                Text("Bedroom \(bedroom)")
                            }
                            .frame(width: 132, height: 100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .padding()
            Divider()
            
            VStack(spacing: 16) {
                Text("What this place offers")
                    .font(.headline)
                
                ForEach(0..<5) { feature in
                    HStack {
                        Image(systemName: "wifi")
                            .frame(width: 32)
                        
                        Text("Wifi")
                            .font(.footnote)
                        
                        Spacer()
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ListingDetailView()
}
