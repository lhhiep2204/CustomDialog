//
//  CustomDialog.swift
//  
//
//  Created by Hoàng Hiệp Lê on 13/07/2023.
//

import SwiftUI

public struct CustomDialog: View {
    
    @Binding var isPresented: Bool
    
    let image: Image?
    let imageSize: CGFloat
    let imageTintColor: Color
    
    let title: String?
    let titleFont: Font
    let titleColor: Color
    
    let subtitle: String?
    let subtitleFont: Font
    let subtitleColor: Color
    
    let primaryButton: CustomDialogButton
    let secondaryButton: CustomDialogButton?
    
    let contentPadding: CGFloat
    
    let buttonsSpacing: CGFloat
    
    let verticalButton: Bool
    
    public var body: some View {
        VStack(spacing: 8) {
            imageView
            titleView
            subtitleView
            buttonsView
        }
        .frame(maxWidth: 300)
        .padding(contentPadding)
        .background(.white)
        .cornerRadius(16)
        .shadow(radius: 16)
        .padding(contentPadding)
    }
    
    @ViewBuilder
    private var imageView: some View {
        if let image = image {
            image
                .resizable()
                .foregroundColor(imageTintColor)
                .scaledToFit()
                .padding(.bottom)
                .frame(width: imageSize, height: imageSize)
        }
    }
    
    @ViewBuilder
    private var titleView: some View {
        if let title = title {
            Text(title)
                .font(titleFont)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(titleColor)
        }
    }
    
    @ViewBuilder
    private var subtitleView: some View {
        if let subtitle = subtitle {
            Text(subtitle)
                .font(subtitleFont)
                .multilineTextAlignment(.center)
                .foregroundColor(subtitleColor)
        }
    }
    
    @ViewBuilder
    private var buttonsView: some View {
        let layout: AnyLayout = {
            if verticalButton {
                return AnyLayout(VStackLayout(spacing: buttonsSpacing))
            } else {
                return AnyLayout(HStackLayout(spacing: buttonsSpacing))
            }
        }()
        
        layout {
            CustomDialogButtonView(isPresented: $isPresented,
                                   button: primaryButton)
            
            if let secondaryButton {
                CustomDialogButtonView(isPresented: $isPresented,
                                       button: secondaryButton)
            }
        }
        .padding(.top)
    }
    
}

struct CustomDialog_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            CustomDialog(isPresented: .constant(true),
                         image: nil,
                         imageSize: 80,
                         imageTintColor: .red,
                         title: "Dialog",
                         titleFont: .title3,
                         titleColor: .black,
                         subtitle: "Dialog text goes here",
                         subtitleFont: .subheadline,
                         subtitleColor: .black,
                         primaryButton: CustomDialogButton(title: "Call to action"),
                         secondaryButton: CustomDialogButton(title: "Call to action",
                                                             style: .stroke),
                         contentPadding: 24,
                         buttonsSpacing: 8,
                         verticalButton: true)
            
            CustomDialog(isPresented: .constant(true),
                         image: Image(systemName: "swift"),
                         imageSize: 80,
                         imageTintColor: .red,
                         title: "Dialog",
                         titleFont: .title3,
                         titleColor: .black,
                         subtitle: "Dialog text goes here",
                         subtitleFont: .subheadline,
                         subtitleColor: .black,
                         primaryButton: CustomDialogButton(title: "Call to action",
                                                           style: .stroke,
                                                           theme: .destructive),
                         secondaryButton: CustomDialogButton(title: "Call to action"),
                         contentPadding: 24,
                         buttonsSpacing: 8,
                         verticalButton: false)
        }
    }
    
}

