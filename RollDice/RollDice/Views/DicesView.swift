//
//  DicesView.swift
//  RollDice
//
//  Created by Alpay Calalli on 23.11.22.
//

import SwiftUI

struct DicesView: View {
    
    @Binding var randomInt: Int
    @Binding var total: Int
    @Binding var numbers: [Int]
    
    @State private var feedback = UINotificationFeedbackGenerator()
    
    
    @Binding var timeRemaining: Int
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Binding var showResult: Bool
    
    var body: some View {
        HStack {
            ZStack {
                Triangle()
                    .stroke(.green, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .frame(width: 60, height: 60)
                
                Button("4"){ resetNum(num: 4) }
                    .padding(EdgeInsets(top: 7, leading: 0, bottom: 0, trailing: 0))
                    .foregroundColor(.white)
                    .font(.system(size: 25))
            }
            
            ZStack {
                Rectangle()
                    .stroke(.blue, lineWidth: 5)
                    .frame(width: 60, height: 60)
                
                Button("6"){ resetNum(num: 6) }
                    .padding(EdgeInsets(top: 3, leading: 0, bottom: 0, trailing: 0))
                    .foregroundColor(.white)
                    .font(.system(size: 25))
            }
            
            ZStack {
                Hexagon()
                    .stroke(.yellow, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .frame(width: 60, height: 60)
                
                Button("8"){ resetNum(num: 8)}
                    .padding(EdgeInsets(top: 2, leading: 0, bottom: 0, trailing: 0))
                    .foregroundColor(.white)
                    .font(.system(size: 25))
            }
            
            ZStack {
                Triangle()
                    .stroke(.blue, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .frame(width: 60, height: 60)
                
                Button("10"){ resetNum(num: 10) }
                    .padding(EdgeInsets(top: 7, leading: 0, bottom: 0, trailing: 0))
                    .foregroundColor(.white)
                    .font(.system(size: 20))
            }
        }
    }
    
    func resetNum(num: Int){
        randomInt = Int.random(in: 1...num)
        feedback.notificationOccurred(.success)
        total += randomInt
        numbers.append(randomInt)
        
        if timeRemaining != randomInt {
            showResult = false
            timeRemaining += 1
        }else{
            showResult = true
        }
    }
}

struct DicesView_Previews: PreviewProvider {
    static var previews: some View {
        DicesView(randomInt: .constant(5), total: .constant(5), numbers: .constant([5]), timeRemaining: .constant(5), showResult: .constant(false))
    }
}
