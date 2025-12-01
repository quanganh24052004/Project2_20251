//
//  InputView.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 1/12/25.
//

import SwiftUI

struct InputView: View {
    
    @Binding var text: String
    let placeholder: String
    let isSecureField: Bool
    
    var body: some View {
        if isSecureField {
            SecureField(placeholder, text: $text)
                .textFieldStyle(CustomTextFieldStyle())
        } else {
            TextField(placeholder, text: $text)
                .textFieldStyle(CustomTextFieldStyle())
        }
    }
}


