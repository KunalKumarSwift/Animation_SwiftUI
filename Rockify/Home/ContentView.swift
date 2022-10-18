//
//  ContentView.swift
//  Rockify
//
//  Created by Kunal Kumar on 2022-10-18.
//

import SwiftUI

struct ContentView: View {
    @State var leavesCount: Int = 12

    @State private var isRotated = false

    var body: some View {
        VStack {
            VStack {
                ZStack {
                    ForEach(0..<$leavesCount.wrappedValue,id: \.self) { index in
                        leaf
                            .rotationEffect(Angle(degrees:
                                                    (Double(index) / Double($leavesCount.wrappedValue)) * 360.0))

                    }

                    Circle()
                        .frame(width: 60.0, height: 60.0)
                        .foregroundColor(.yellow)
                        .padding()
                        .overlay(
                            Circle()
                                .stroke(.red, lineWidth: 7)
                            )
                }
                .onAppear {
                    $isRotated.wrappedValue = true
            }
                .rotationEffect(Angle.degrees(isRotated ? 360 : 0))
                .animation(.linear(duration: 9).repeatForever(autoreverses: false), value: isRotated)
            }.padding(.top, 200.0)
            Spacer()
            HStack {
                Button {
                    $leavesCount.wrappedValue += 1
                } label: {
                    Text("Add leaves")
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Capsule().foregroundColor(.green))
                        .foregroundColor(.white)
            }
                Button {
                    $leavesCount.wrappedValue -= 1
                } label: {
                    Text("Remove leaves")
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Capsule().foregroundColor(.red))
                        .foregroundColor(.white)
                    
                }

            }


        }

    }

    var leaf: some View {
        RoundedRectangle(cornerRadius: 40.0)
            .foregroundColor(.red)
            .frame(width: 40.0 - CGFloat($leavesCount.wrappedValue), height: 80.0 - CGFloat($leavesCount.wrappedValue))
            .offset(x: 100, y: 100)


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            //ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
