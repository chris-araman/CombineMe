//
//  SwiftUIView.swift
//  CombineMe (iOS)
//
//  Created by Swift Developer on 8/7/20.
//

import SwiftUI

struct TestView: View {
    
    var body: some View {
        VStack {
            GikeGridView()
            NavigationView {
                NavigationLink(destination: BikeStationView()) {
                    Text("Bike Stations")
                }.navigationBarTitle("Bike Stations")
                /*NavigationLink(destination: HomeView()) {
                 Text("Home")
                 }.navigationBarTitle("Bike Home")*/
            }
        }
    }
}

struct BikeList: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Bike Image")
                ZStack {
                    
                    Image(uiImage: UIImage(named:"bike.jpg")!).resizable()//.frame(width: 100, height: 100)
                    //Image(uiImage: UIImage(named: "Material.png")!).resizable()
                    VStack {
                        Label("Bike", systemImage: "bicycle").padding().background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8))
                            .foregroundColor(.secondary)
                        Text("Let find a station ").padding().background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8))
                            .foregroundColor(.secondary)
                    }
                }
                NavigationLink(destination: BikeStationView()) {
                    Text("Bike Stations")
                }.navigationBarTitle("Bike Stations")
            }.padding()
        }.padding()
    }
}


struct HomeView: View {
    var body: some View {
        TabView {
            GikeGridView()
                .tabItem {
                    Image(systemName: "bicycle.circle")
                    Text("Stations")
                }.badge(2) // now very easy to add
            BikeList()
                .tabItem {
                    Image(systemName: "bicycle")
                    Text("Map")
                }.badge(5)
            CombineUI()
                .tabItem {
                    Image(systemName: "arrow.triangle.capsulepath")
                    Text("Combine")
                }.badge(7)
        }
        /*NavigationView {
         VStack {
         GikeGridView()
         NavigationLink(destination: BikeStationView()) {
         Text("Bike Stations")
         }.navigationBarTitle("Bike Stations")
         /*NavigationLink(destination: HomeView()) {
          Text("Home")
          }.navigationBarTitle("Bike Home")*/
         }
         }
         }*/
        /* VStack{
         Text("Lets Get Some Bikes !!!")
         BikeMenu()
         FormView()
         }*/
    }
    
    func skip() {
        print("Menu Pressed")
    }
    
    /*
     struct BikeMenu: View {
     var body: some View {
     Menu("Actions") {
     Button("Duplicate", action: {skip()})
     Button("Rename", action: {skip()})
     Button("Delete…", action: {skip()})
     Menu("Bike Info") {
     Button("Copy", action: {skip()})
     Button("Copy Formatted", action: {skip()})
     Button("Copy Library Path", action: {skip()})
     NavigationLink(destination: BikeStationView()) {
     Text("Bike System Info")
     }.navigationBarTitle("Bike Menu")
     NavigationLink(destination: BikeStationView()) {
     Text("Bike Stations")
     }.navigationBarTitle("Bike Stations")
     }
     }
     }
     }
     */
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
