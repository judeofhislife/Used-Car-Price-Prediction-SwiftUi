//
//  PriceViewModel.swift
//  AudiCarPricePrediction
//
//  Created by BS901 on 11/23/22.
//

import Foundation
import SwiftUI

final class PriceViewModel: ObservableObject {
    
    let mlModel = AudiCarPriceModel()
    
    var modelName = ["A1", "A2", "A3", "A4", "A5", "A6", "A7", "Q1", "Q3", "Q5", "Q7"]
    var fuelType = ["Petrol", "Diesel"]
    var year = [2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020]
    var transmissionType = ["Automatic", "Semi-Auto", "Manual"]
    
    @Published var nameSelection = 0
    @Published var fuelSelection = 0
    @Published var yearSelection = 0
    @Published var transmissionSelec = 0
    @Published var mileage: Double = 0
    
    @Published var isShowAlert = false
    @Published var alertTitle = "Your ideal car price"
    @Published var alertMessage = ""
    
    func calculatePrice() {
        do {
            let AudiCarPriceModelOutput = try mlModel.prediction(model: String(nameSelection), year: Double(yearSelection), transmission: String(transmissionSelec), mileage: Double(mileage), fuelType: String(fuelSelection))
            let price = AudiCarPriceModelOutput.price
            
            alertMessage = String("$\(Int(price))")
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was an error occured. Please try again!"
        }
    }
}
