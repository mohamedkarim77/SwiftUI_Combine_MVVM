//
//  ErrorView.swift
//  SwiftUI_Combine_MVVM
//
//  Created by Mohamed Abdelkarim on 05/09/2022.
//

import SwiftUI

struct ErrorView: View {
 
    typealias ErrorViewActionHandler = () -> Void
    
    let error: Error
    let handler: ErrorViewActionHandler
    
    internal init(error: Error, handler: @escaping ErrorView.ErrorViewActionHandler) {
        self.error = error
        self.handler = handler
    }
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50,weight: .heavy))
            Text("Oooops!")
                .font(.system(size: 24, weight: .heavy))
                .padding()
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 20, weight: .light))
                .multilineTextAlignment(.center)
              
            Button {
                handler()
            } label: {
                Text("Retry")
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 10)
            .background(.purple)
            .foregroundColor(.white)
            .font(.system(size: 15, weight: .heavy))
            .cornerRadius(8)
            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError) {}
    }
}
