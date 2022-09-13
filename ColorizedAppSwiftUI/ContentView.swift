//
//  ContentView.swift
//  ColorizedAppSwiftUI
//
//  Created by Vasiliy on 13.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    @State private var text = ""
    
    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.5)
                .ignoresSafeArea()
            VStack {
                Rectangle()
                    .foregroundColor(Color(CGColor(
                        red: redSliderValue/255,
                        green: greenSliderValue/255,
                        blue: blueSliderValue/255, alpha: 1)))
                    .frame(width: 300, height: 140)
                    .cornerRadius(25)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 4))
                    .padding(.bottom, 30)

                ColorSliderView(value: $redSliderValue, color: .red)
                ColorSliderView(value: $greenSliderValue, color: .green)
                ColorSliderView(value: $blueSliderValue, color: .blue)

                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSliderView: View {
    @Binding var value: Double
    var color: Color

    var body: some View {
        HStack {
            Text("\(lround(value))")
                .frame(width: 40)
            Slider(value: $value, in: 0...255)
                .accentColor(color)
        }
    }
}
