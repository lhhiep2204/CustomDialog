//
//  CustomDialogModifier.swift
//  
//
//  Created by Hoàng Hiệp Lê on 13/07/2023.
//

import SwiftUI

public struct CustomDialogModifier: ViewModifier {
    
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
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            ZStack {
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.2))
                    .ignoresSafeArea()
                CustomDialog(isPresented: $isPresented,
                             image: image,
                             imageSize: imageSize,
                             imageTintColor: imageTintColor,
                             title: title,
                             titleFont: titleFont,
                             titleColor: titleColor,
                             subtitle: subtitle,
                             subtitleFont: subtitleFont,
                             subtitleColor: subtitleColor,
                             primaryButton: primaryButton,
                             secondaryButton: secondaryButton,
                             contentPadding: contentPadding,
                             buttonsSpacing: buttonsSpacing,
                             verticalButton: verticalButton)
            }
            .opacity(isPresented ? 1 : 0)
        }
    }
    
}

public extension View {
    
    func showAlert(isPresented: Binding<Bool>,
                   image: Image? = nil,
                   imageSize: CGFloat = 80,
                   imageTintColor: Color = .black,
                   title: String? = nil,
                   titleFont: Font = .title3,
                   titleColor: Color = .black,
                   subtitle: String? = nil,
                   subtitleFont: Font = .subheadline,
                   subtitleColor: Color = .black,
                   primaryButton: CustomDialogButton,
                   secondaryButton: CustomDialogButton? = nil,
                   contentPadding: CGFloat = 24,
                   buttonsSpacing: CGFloat = 8,
                   verticalButton: Bool = false) -> some View {
        return modifier(CustomDialogModifier(isPresented: isPresented,
                                             image: image,
                                             imageSize: imageSize,
                                             imageTintColor: imageTintColor,
                                             title: title,
                                             titleFont: titleFont,
                                             titleColor: titleColor,
                                             subtitle: subtitle,
                                             subtitleFont: subtitleFont,
                                             subtitleColor: subtitleColor,
                                             primaryButton: primaryButton,
                                             secondaryButton: secondaryButton,
                                             contentPadding: contentPadding,
                                             buttonsSpacing: buttonsSpacing,
                                             verticalButton: verticalButton))
    }
    
}
