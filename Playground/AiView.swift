//
//  AiView.swift
//  Playground
//
//  Created by Afeez Yunus on 16/06/2024.
//

import SwiftUI

struct AiView: View {
    @State var  question = ""
    @Namespace var animate
    var Namespace: Namespace.ID
    var Namespace2: Namespace.ID
    @Binding var openAi:Bool
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
            Image(systemName: "xmark")
                .padding()
                .foregroundStyle(.black)
                .background(.white)
                .clipShape(Circle())
            }.padding(.trailing, 16)
            .onTapGesture {
                withAnimation(.spring(duration: 0.4, bounce: 0.3)) {
                    openAi = false
                }
            }
            VStack(spacing:72){
                VStack{
                    Circle()
                        .matchedGeometryEffect(id: "circle", in: Namespace)
                        .frame(width: 72)
                        
                    
                    VStack(spacing:16){
                        Text("How can I help?")
                            .font(.title2)
                            .transitUpwards(trigger: openAi)
                        
                    }
                }
                HStack{
                    TextField(text: $question, label: {
                        Text("What would you like to know?")
                    })
                    .padding(12)
                    .tint(.black)
                    .foregroundStyle(.black)
                    Image(systemName: "arrow.right")
                        .foregroundStyle(.white)
                        .padding(8)
                        .background(.blue)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .padding(4)
                        
                }
                .background(Color("bg"))
                .clipShape(RoundedRectangle(cornerRadius: 44))
                .transitSideways(trigger: openAi)
            }
            .padding(16)
            .background(RoundedRectangle(cornerRadius: 24)
                .foregroundStyle(.white)
                .matchedGeometryEffect(id: "bg", in: Namespace2))
            .padding(.horizontal, 16)
            .padding(.bottom, 32)
        }.background(.gray.opacity(0.4))
            .ignoresSafeArea()
        
    }
}

extension View {
    func transitUpwards (trigger:Bool) -> some View {
        self
            .offset(y: trigger ? 0 : -44)
            .opacity( trigger ? 1:0)
        
    }
    func transitSideways (trigger:Bool) -> some View {
        self
            .offset(x: trigger ? 0 : 200)
            .opacity( trigger ? 1:0)
    }
}
/*
 #Preview {
 AiView {
 
 }
 }
 
 */
