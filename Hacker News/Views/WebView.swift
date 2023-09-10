//
//  WebView.swift
//  Hacker News
//
//  Created by Andrea Yong on 10/9/23.
//

import Foundation
import WebKit
import SwiftUI

// incorporating UIKit component that is SwiftUI compatible
struct WebView: UIViewRepresentable {
    let urlString: String?
    
    // 2 delegate methods
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        // unwrapping of optional string
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
