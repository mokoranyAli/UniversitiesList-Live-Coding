//
//  UniversitiesListView.swift
//  ElMenus
//
//  Created by Mohamed Korany on 19/06/2022.
//

import SwiftUI

struct UniversitiesListView: View {
    
    @ObservedObject var viewModel: UniversitiesListViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
            List {
                ForEach(viewModel.universities, id: \.self) { university in
                    addTextIfPossible(word: university.name)
                }
            }
            .navigationTitle("ElMenus Task")
            .searchable(text: $viewModel.word)
                
                if viewModel.state == .loading {
                    ProgressView()
                }
            }
        }
    }
    
    
    func addTextIfPossible(word: String?) -> AnyView? {
        guard let word = word else { return nil }
        return AnyView(Text(word))
    }
}

struct UniversitiesListView_Previews: PreviewProvider {
    static var previews: some View {
        UniversitiesListView(viewModel: .init())
    }
}
