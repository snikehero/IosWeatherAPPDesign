//
//  HomeView.swift
//  WeatherAPP
//
//  Created by Moises Sanchez on 14/06/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: Background Color
                Color.background
                    .ignoresSafeArea()
                
                //MARK: Background Image
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                
                //MARK: House IMAGE
                Image("House")
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.top, 257)
                //MARK: Current Weather
                VStack(spacing: -10) {
                    Text("Montreal")
                        .font(.largeTitle)
                    
                
                    VStack {
                        Text(attributedString)
                        Text("H:24°    L: 18°")
                            .font(.title3.weight(.semibold))
                        
                    }
                    Spacer()
                }
                .padding(.top, 51)
                //MARK: TabBar
                TabBar(action: {})
            }
            .navigationBarHidden(true)
        }
    }
    private var attributedString: AttributedString {
        var string = AttributedString("19°" + "\n " + "Mostly Clear")
        if let temp = string.range(of: "19°") {
            string[temp].font = .system(size: 95, weight: .thin)
            string[temp].foregroundColor = .primary
        }
        if let weather = string.range(of: "Mostly Clear") {
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }
        if let pipe = string.range(of: " | "){
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary
        }
        return string
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
