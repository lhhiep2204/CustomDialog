//
//  CustomDialogButtonView.swift
//  
//
//  Created by Hoàng Hiệp Lê on 13/07/2023.
//

import SwiftUI

public struct CustomDialogButton {
    
    let title: String
    let font: Font
    let primaryColor: Color
    let secondaryColor: Color
    let destructiveColor: Color
    let style: Style
    let theme: Theme
    let action: () -> Void
    
    public init(title: String,
                font: Font = .headline,
                primaryColor: Color = .blue,
                secondaryColor: Color = .white,
                destructiveColor: Color = .red,
                style: Style = .fill,
                theme: Theme = .default,
                action: @escaping () -> Void = { }) {
        self.title = title
        self.font = font
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.destructiveColor = destructiveColor
        self.style = style
        self.theme = theme
        self.action = action
    }
    
    public enum Style {
        case fill
        case stroke
    }
    
    public enum Theme {
        case `default`
        case destructive
    }
    
}

struct CustomDialogButtonView: View {
    
    @Binding var isPresented: Bool
    let button: CustomDialogButton
    
    var body: some View {
        let color: Color = {
            switch button.theme {
            case .`default`:
                return button.primaryColor
            case .destructive:
                return button.destructiveColor
            }
        }()
        
        switch button.style {
        case .fill:
            Button {
                button.action()
                withAnimation {
                    isPresented.toggle()
                }
            } label: {
                Text(button.title)
                    .lineLimit(1)
                    .font(.headline)
                    .fontWeight(.bold)
            }
            .foregroundColor(button.secondaryColor)
            .padding()
            .frame(maxWidth: .infinity)
            .background(color)
            .cornerRadius(8)
        case .stroke:
            Button {
                button.action()
                withAnimation {
                    isPresented.toggle()
                }
            } label: {
                Text(button.title)
                    .lineLimit(1)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(color)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(button.secondaryColor)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(color, lineWidth: 2)
            )
        }
    }
    
}

struct CustomDialogButtonView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack(spacing: 16) {
            CustomDialogButtonView(isPresented: .constant(true),
                                   button: CustomDialogButton(title: "Call to action"))
            CustomDialogButtonView(isPresented: .constant(true),
                                   button: CustomDialogButton(title: "Call to action",
                                                              style: .stroke))
            CustomDialogButtonView(isPresented: .constant(true),
                                   button: CustomDialogButton(title: "Call to action",
                                                              theme: .destructive))
            CustomDialogButtonView(isPresented: .constant(true),
                                   button: CustomDialogButton(title: "Call to action",
                                                              style: .stroke,
                                                              theme: .destructive))
        }
        .padding()
    }
    
}

