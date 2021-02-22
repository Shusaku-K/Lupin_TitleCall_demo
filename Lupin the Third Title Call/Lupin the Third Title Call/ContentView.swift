//
//  ContentView.swift
//  Lupin the Third Title Call
//
//  Created by 金城秀作 on 2021/02/22.
//
import SwiftUI

struct ContentView: View {
   @ObservedObject private var lupinTitleViewModel = LupinTitleViewModel()
   
   var body: some View {
       Group {
           if lupinTitleViewModel.isTyping {
               ZStack {
                   Color(.black)
                       .edgesIgnoringSafeArea(.all)
                   
                   VStack {
                       Spacer()
                       
                       Text(lupinTitleViewModel.typeWrite)
                           .font(.largeTitle)
                           .fontWeight(.heavy)
                           .foregroundColor(.white)
                       
                       Spacer()
                       
                       Text("音楽：魔王魂")
                           .foregroundColor(.white)
                   }
               }
           } else {
               VStack {
                   TextField("Title", text: $lupinTitleViewModel.title)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .padding()
                   Button(action: {
                       self.lupinTitleViewModel.startTitleCall()
                   }) {
                       Text("Start")
                           .padding()
                   }
               }
           }
       }
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
       ContentView()
   }
}
