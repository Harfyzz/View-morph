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
            
            VStack(spacing:72){
                VStack{
                    Circle()
                        .matchedGeometryEffect(id: "circle", in: Namespace)
                        .frame(width: 72)
                        .onTapGesture {
                            withAnimation(.spring(duration: 0.4, bounce: 0.3)) {
                                openAi = false
                            }
                        }
                    
                    VStack(spacing:16){
                        Text("How can I help?")
                            .font(.title2)
                        
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
            }
            .padding(16)
            .background(RoundedRectangle(cornerRadius: 24)
                .foregroundStyle(.white)
                .matchedGeometryEffect(id: "bg", in: Namespace2))
            .padding(16)
            .clipped()
            .padding(.bottom, 16)
        }.background(.gray.opacity(0.4))
            .ignoresSafeArea()
        
    }
}
/*
 #Preview {
 AiView {
 
 }
 }
 
 */
