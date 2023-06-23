//
//  OpenWeather template generated by OpenBytes on 12/15/22.
//  Copyright (c) 2023 OpenBytes
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the conditions found at the following link:
//  https://github.com/0xOpenBytes/ios-BASE/blob/main/LICENSE
//
// Created by Leif.
//  SearchScreen.swift
//

import OpenBytesNavigation
import SwiftUI

struct SearchLocationScreen: View {
    @StateObject var viewModel: SearchLocationViewModel

    var body: some View {
        viewModel.view { content in
            List {
                ForEach(content.result) { location in
                    LocationResultItem(location: location) {
                        self.viewModel.toggleFavorite(for: location)
                    }
                }
            }
            .buttonStyle(.borderless)
            .searchable(
                text: viewModel.binding(\.searchText),
                prompt: "Search by name or zipcode"
            )
        }
        .navigationTitle("Search")
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        OpenBytesNavigationView.preview {
            SearchLocationScreen(viewModel: .mock)
        }
    }
}
