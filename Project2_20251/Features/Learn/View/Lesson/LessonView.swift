//
//  LessonView.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 13/10/25.
//

import SwiftUI

struct LessonView: View {
    let title: String
    let subtitle: String
    let image: Image
    var gradient: LinearGradient = LinearGradient(
        colors: [Color(red: 101/255, green: 208/255, blue: 102/255),
                 Color(red: 70/255,  green: 186/255, blue: 78/255)],
        startPoint: .leading, endPoint: .trailing
    )
    var height: CGFloat = 100
    var cornerRadius: CGFloat = 24
    
    var body: some View {
         ZStack(alignment: .leading) {
             // Card background
             RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                 .fill(gradient)
                 .overlay(
                     // viền sáng nhẹ giống mock
                     RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                         .stroke(Color.white.opacity(0.25), lineWidth: 6)
                         .blur(radius: 0.5)
                         .mask(
                             RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                         )
                 )
                 .shadow(color: .black.opacity(0.08), radius: 10, x: 0, y: 4)

             HStack(spacing: 18) {
                 // Leading circle image
                 image
                     .resizable()
                     .scaledToFill()
                     .frame(width: height - 30, height: height - 30)
                     .clipShape(Circle())
                     .overlay(
                         Circle().stroke(.white, lineWidth: 8)
                     )
                     .shadow(radius: 4)
                     .padding(.leading, 18)

                 // Texts
                 VStack(alignment: .leading, spacing: 10) {
                     Text(title)
                         .font(.system(size: 20, weight: .bold, design: .rounded))
                         .foregroundStyle(.white)
                         .minimumScaleFactor(0.8)
                         .lineLimit(1)

                     Text(subtitle)
                         .font(.system(size: 16, weight: .medium, design: .rounded))
                         .foregroundStyle(.white.opacity(0.95))
                         .lineLimit(1)
                 }

                 Spacer(minLength: 12)
             }
             .padding(.trailing, 20)
         }
         .frame(height: height)
         .accessibilityElement(children: .combine)
         .accessibilityLabel("\(title). \(subtitle)")
     }
}

#Preview {
    LessonView(title: "Schools", subtitle: "1. Trường học", image: Image("img_School"))
}
