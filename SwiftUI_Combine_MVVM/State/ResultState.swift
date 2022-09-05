//
//  ResultState.swift
//  SwiftUI_Combine_MVVM
//
//  Created by Mohamed Abdelkarim on 05/09/2022.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
