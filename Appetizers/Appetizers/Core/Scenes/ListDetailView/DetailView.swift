//
//  DetailView.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 28/08/25.
//

import SwiftUI

struct DetailView: View {
    
    let appetizer: AppetizerModel
    
    var body: some View {
        VStack {
            ImageLoaderView()
                .frame(width: 320, height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40){
                    VStack(spacing: 5){
                        Text("Calories")
                            .bold()
                            .font(.caption)
                        
                        Text("\(appetizer.calories)")
                            .foregroundStyle(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    
                    VStack (spacing: 5){
                        Text("Carbs")
                            .bold()
                            .font(.caption)
                        
                        Text("\(appetizer.carbs)")
                            .foregroundStyle(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    
                    VStack (spacing: 5){
                        Text("Protein")
                            .bold()
                            .font(.caption)
                        
                        Text("\(appetizer.protein)")
                            .foregroundStyle(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                }
            }
            
            Spacer()
            
            Button {
                print("Button tapped")
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Aadd order")
                
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundStyle(.white)
                    .background(Color.brandPrimary)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.bottom, 30)
             
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            
            Button {
                print("Dismiss")
            }label: {
                ZStack {
                
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(Color.white)
                    .opacity(0.6) // <- DarkMode
                    
                    
                Image(systemName: "xmark")
                        .imageScale(.small)
                    .frame(width: 44, height: 44)
                    .foregroundStyle(Color.xMarkButton) // <- DarkMode
                                
                }
                
            }
            
        }
    }
}

#Preview {
    DetailView(appetizer: MockData.sampleAppetizer)
}
