//
//  StatisticsViewModel.swift
//  App727
//
//  Created by IGOR on 23/07/2024.
//

import SwiftUI
import CoreData

final class StatisticsViewModel: ObservableObject {

    @Published var isIndicators: Bool = false
    @Published var AddYC: String = ""
    @Published var AddRC: String = ""
    @Published var AddFW: String = ""
    @Published var AddFC: String = ""
    @Published var AddAge: String = ""
    @Published var AddHeight: String = ""
    @Published var AddSessions: String = ""
    
    @AppStorage("YC") var YC: String = ""
    @AppStorage("RC") var RC: String = ""
    @AppStorage("FW") var FW: String = ""
    @AppStorage("FC") var FC: String = ""
    @AppStorage("Age") var Age: String = ""
    @AppStorage("Height") var Height: String = ""
    @AppStorage("Sessions") var Sessions: String = ""


}

