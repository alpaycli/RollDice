//
//  ContentView.swift
//  RollDice
//
//  Created by Alpay Calalli on 23.11.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var randomInt = Int.random(in: 1..<10)
    
    @State private var total = 0
    
    @State private var numbers = [Int]()
    
    @State private var timeRemaining = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var showResult = false

    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.vertical)
                VStack {
                    
                    Spacer()
                    
                    Section {
                        DicesView(randomInt: $randomInt, total: $total, numbers: $numbers, timeRemaining: $timeRemaining, showResult: $showResult)
                    }
                    Spacer()
                    
                    Section {
                        ZStack{
                            Rectangle()
                                .fill(.white)
                                .frame(width: 80, height: 80)
                            
                            Text("\(randomInt)")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Spacer()
                    Spacer()
                    
                    Section {
                        Text("Total: ")
                            .foregroundColor(.green)
                            .font(.title)
                        + Text("\(total)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                    }
                    
                    
                    Section {
                        Form {
                            ForEach(numbers, id: \.self) { num in
                                Text("\(num)")
                            }
                        }
                    }
                    .listRowBackground(Color.black.opacity(0.4))
                    
//                    Text(showResult ? "\(randomInt)" : "\(Int.random(in: 1..<randomInt))")
//                        .foregroundColor(.green)
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
                    
                    Spacer()
                }
            }
            .navigationTitle("🎲 Roll Dice")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
