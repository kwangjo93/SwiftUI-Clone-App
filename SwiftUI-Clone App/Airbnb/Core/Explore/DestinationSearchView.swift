//
//  DestinationSearchView.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/13/24.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    
    var body: some View {
        VStack {
            Button {
                show.toggle()
            } label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            }
            
            VStack(alignment: .leading) {
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destinations", text: $destination)
                            .font(.subheadline)
                    }
                    .frame(height: 25)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedPickerView(title: "Where", description: "Add destination")
                }
            } //VStack
            .padding()
            .frame(height: selectedOption == .location ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .location }
            }
            
            VStack {
                if selectedOption == .dates {
                    Text("Show expanded view")
                    Spacer()
                } else {
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .padding()
            .frame(height: selectedOption == .dates ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .dates }
            }
            
            VStack {
                if selectedOption == .guests {
                    Text("Show expanded view")
                    Spacer()
                } else {
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .padding()
            .frame(height: selectedOption == .guests ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .guests }
            }
            
            
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
            }
            .font(.subheadline)
            .fontWeight(.semibold)
        }//VStack
    }
}
