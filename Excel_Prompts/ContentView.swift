//
//  ContentView.swift
//  Excel_Prompts
//
//  Created by Jonathan Brown on 03/06/2025.
//

import SwiftUI




struct Formula: Identifiable {
    let id = UUID()
    let name: String
    let syntax: String
    let description: String
}

struct ContentView: View {
    let formulas = [
        Formula(name: "SUM", syntax: "=SUM(A1:A10)", description: "Adds all the numbers in a range of cells.")
        ,Formula(name: "AVERAGE", syntax: "=AVERAGE(B1:B5)", description: "Returns the average (arithmetic mean).")
        ,Formula(name: "VLOOKUP", syntax: "=VLOOKUP(42, A2:B10, 2, FALSE)", description: "Looks up a value in the leftmost column.")
        ,Formula(name: "IF", syntax: "=IF(A1>100, \"Yes\", \"No\")"
        ,description: "Returns one value if a condition is TRUE, another if FALSE.")
        ,Formula(name: "CONCATENATE", syntax: "=CONCATENATE(A1, B1)", description: "Joins two or more text strings into one.")
        ,Formula(name: "MAX", syntax: "=MAX(C1:C10)", description: "Returns the largest value in a range.")
        ,Formula(name: "MIN", syntax: "=MIN(D1:D10)", description: "Returns the smallest value.")
        ,Formula(name: "COUNT", syntax: "=COUNT(A1:A100)", description: "Counts how many numbers are in the range.")
        ,Formula(name: "LEN", syntax: "=LEN(A1)", description: "Returns the number of characters in a cell.")
        ,Formula(name: "NOW", syntax: "=NOW()", description: "Returns the current date and time.")
    ]
    
    @State private var selectedFormula: Formula?

    var body: some View {
        VStack {
            Text("Press the formula name button for its usage info")
                .font(.headline)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(formulas) { formula in
                        
                        Button(action: {
                            selectedFormula = formula
                        }) {
                            Text(formula.name)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(8)
                        }
                    }
                }
                .padding()
            }
            
            Divider()
            
            if let formula = selectedFormula {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Formula: \(formula.name)").bold()
                    Text("Syntax: \(formula.syntax)")
                    Text("Description: \(formula.description)")
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            } else {
                Text("Press a formula button above to see details.")
                    .padding()
            }

            Spacer()
        }
        .padding()
    }
}






//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}
