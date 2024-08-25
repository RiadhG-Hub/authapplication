//
//  RootRoutes.swift
//  AuthApplication
//
//  Created by riadh gharbi on 25/8/2024.
//

import Foundation
import SwiftUI
import SwiftUIRouter



struct RootView: View {
    @EnvironmentObject private var navigator: Navigator
    var body: some View {
        RootRoutes().onAppear{
            navigator.navigate(PagesPaths.spalshScreen)
        }
        
        
    }
    
}




private struct RootRoutes: View {
    var body: some View {
        /// (4) A `SwitchRoutes` is like a `switch`, but for routes. Only the first matching `Route` will be rendered.
        /// This allows you to create 'fallback' routes (shown below), as well as gain potentional performance boost:
        /// once a route has been matched, any following routes can immediately skip any work on path matching.
        SwitchRoutes {
            
            Route(PagesPaths.spalshScreen, content: SplashView())
            Route(PagesPaths.login, content: LoginView())
            Route(PagesPaths.home, content: HomeView())
            
            
        }
        .navigationTransition()
    }
}
