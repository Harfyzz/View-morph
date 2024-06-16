//
//  AiLaunch.swift
//  Playground
//
//  Created by Afeez Yunus on 16/06/2024.
//

import SwiftUI

struct AiLaunch: View {
    @Namespace private var animate
    @Namespace private var background
    @State var openAi = false
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                if openAi == false {
                    HStack{
                        Spacer()
                        ZStack{
                            Circle()
                                .foregroundStyle(.white)
                                .matchedGeometryEffect(id: "bg", in: background)
                                .frame(height: 50)
                            Circle()
                                .matchedGeometryEffect(id: "circle", in: animate)
                                .frame(width: 80)
                                .padding()
                                .onTapGesture {
                                    withAnimation(.spring(duration: 0.4, bounce: 0.3)) {
                                        openAi = true
                                    }
                                }
                            
                        }
                        
                    }
                }
                
                else {
                    AiView(Namespace: animate, Namespace2: background, openAi: $openAi)
                }
                
            }
        }
        .ignoresSafeArea()
        
        
    }
}

#Preview {
    AiLaunch()
}
