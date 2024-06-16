//
//  Switch cards.swift
//  Playground
//
//  Created by Afeez Yunus on 16/06/2024.
//

import SwiftUI

struct Switch_cards: View {
    @State private var isExpanded = true
    @Namespace private var profileAnimation
    var body: some View {
        VStack(spacing:24){
            if isExpanded{
                expandedProfileView(namespace: profileAnimation, isExpanded: $isExpanded)
            }
            else {
                collapsedProfileView(namespace: profileAnimation, isExpanded: $isExpanded)
            }
            
        }
    }
}
struct expandedProfileView: View {
    var namespace: Namespace.ID
    @Binding  var isExpanded:Bool
    var body: some View {
        VStack(spacing:24){
            Circle()
                .matchedGeometryEffect(id: "Image", in: namespace)
                .frame(width: 200)
                .foregroundStyle(.gray.opacity(0.2))
            VStack(spacing:12){
                Text("Goodnight Robicheaux")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .matchedGeometryEffect(id: "Name", in: namespace)
                Text("iOS design Engineer")
                    .matchedGeometryEffect(id: "Role", in: namespace)
            }
            Button(action: {
                withAnimation {
                    isExpanded = false
                }
            }, label: {
                Text("Collapse")
                    .frame(width: 240, height: 44)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            })
            .matchedGeometryEffect(id: "Button", in: namespace)
        }
    }
}

struct collapsedProfileView: View {
    var namespace: Namespace.ID
    @Binding var isExpanded:Bool
    var body: some View{
        VStack(spacing:24){
            HStack{
                Circle()
                    .matchedGeometryEffect(id: "Image", in: namespace)
                    .frame(width: 64)
                    .foregroundStyle(.gray.opacity(0.2))
                VStack(spacing:12){
                    Text("Goodnight Robicheaux")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .matchedGeometryEffect(id: "Name", in: namespace)
                    Text("iOS design Engineer")
                        .matchedGeometryEffect(id: "Role", in: namespace)
                }
            }
            Button(action: {
                withAnimation {
                    isExpanded = true
                }
                
            }, label: {
                Text("Expand")
                    .frame(width: 240, height: 44)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            })
            .matchedGeometryEffect(id: "Button", in: namespace)
        }
    }
   
}

#Preview {
    Switch_cards()
}
