//
//  ContentView.swift
//  AudiCarPricePrediction
//
//  Created by BS901 on 11/23/22.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = PriceViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Model")
                        .fontWeight(.light)
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                    Spacer()
                }
                Picker("Select your model", selection: $viewModel.nameSelection) {
                    ForEach(0 ..< viewModel.modelName.count, id: \.self) { car in
                        Text("\(viewModel.modelName[car])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                HStack {
                    Text("Fuel Type")
                        .fontWeight(.light)
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                    Spacer()
                }
                Picker("Select fuel type", selection: $viewModel.fuelSelection) {
                    ForEach(0 ..< viewModel.fuelType.count, id: \.self) { car in
                        Text("\(viewModel.fuelType[car])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                HStack {
                    Text("Transmission Type")
                        .fontWeight(.light)
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                    Spacer()
                }
                Picker("Select transmission type", selection: $viewModel.transmissionSelec) {
                    ForEach(0 ..< viewModel.transmissionType.count, id: \.self) { car in
                        Text("\(viewModel.transmissionType[car])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                VStack {
                    Spacer()
                    HStack {
                        Text("Manufactured Year")
                            .fontWeight(.light)
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                        Spacer()
                    }
                    Picker("Select manufactured year", selection: $viewModel.yearSelection) {
                        ForEach(0 ..< viewModel.year.count, id: \.self) { car in
                            Text(String("\(viewModel.year[car])"))
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    HStack {
                        Text("Mileage")
                            .fontWeight(.light)
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                        Spacer()
                    }
                    
                    Slider(value: $viewModel.mileage, in: 0...100000)
                        .padding(20)
                    Text("\(viewModel.mileage, specifier: "%.2f") miles")
                        .foregroundColor(.black)
                        .fontWeight(.light)
                        .font(.largeTitle)
                    Spacer()
                }
                Spacer()
                    .frame(height: 30)
                Button {
                    viewModel.calculatePrice()
                    viewModel.isShowAlert = true
                } label: {
                    Text("Calculate")
                        .fontWeight(.light)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(15)
                        .background(Color(.gray))
                        .clipShape(Capsule())
                        .shadow(color: Color(.gray).opacity(0.4), radius: 5, x: 5, y: 5)
                }
                .alert(isPresented: $viewModel.isShowAlert) {
                    Alert(
                        title: Text(viewModel.alertTitle),
                        message: Text(viewModel.alertMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
