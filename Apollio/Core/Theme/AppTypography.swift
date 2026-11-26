//
//  AppTypography.swift.swift
//  Apollio
//
//  Created by Zainab Nooh on 25/11/2026.
//

//
//  AppTypography.swift
//  Apollio
//

import SwiftUI

/// Shared fonts. They use the native system font (SF Pro) with Apple's text styles,
/// so they scale automatically with Dynamic Type.
extension Font {
    static let appLargeTitle = Font.largeTitle.bold()   // big screen headings
    static let appTitle = Font.title3.bold()            // section headings
    static let appHeadline = Font.headline              // buttons, bold rows
    static let appBody = Font.body                      // normal text
    static let appSubheadline = Font.subheadline        // secondary lines
    static let appFootnote = Font.footnote              // small helper text
    static let appCaption = Font.caption2.bold()        // tiny labels
}
