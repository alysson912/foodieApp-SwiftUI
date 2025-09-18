//
//  DetailView.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 28/08/25.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: AppetizerModel
    @Binding var isShowingDetail: Bool
    

    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                //.aspectRatio(contentMode: .fit)
                .frame(width: 320, height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                NutritionInfo
                
            }
            
            Spacer()
            
            Button {
                order.add(appetizer)
                isShowingDetail = false
            } label: {
                
                Text( "$\(appetizer.price, specifier: "%.2f") - Add order")
                
            }
            .modifier(StandardButtonStyle())
           .padding(.bottom, 30)
            
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            
            Button {
                isShowingDetail = false
            }label: {
                
                XDismissButton()
            }
            
        }
    }
    
    private var NutritionInfo: some View {
        
        HStack (spacing: 40){
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
                
                Text("\(appetizer.carbs) g")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
                    .italic()
            }
            
            VStack (spacing: 5){
                Text("Protein")
                    .bold()
                    .font(.caption)
                
                Text("\(appetizer.protein) g")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
                    .italic()
            }
        }
    }
}

#Preview {
    DetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}
