//
//  ContentView.swift
//  ElMenus
//
//  Created by Mohamed Korany on 19/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        UniversitiesListView(viewModel: .init())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
