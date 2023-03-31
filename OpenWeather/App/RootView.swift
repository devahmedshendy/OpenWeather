//
//  OpenWeather template generated by OpenBytes on 12/14/22.
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
//  RootView.swift
//

import OpenBytesNavigation
import SwiftUI

struct RootView: View {
    enum Tab {
        case home
        case search
        case summary
        case profile
    }

    @ObservedObject var navigation: Navigation

    var body: some View {
        TabView(selection: $navigation.tab) {
            OpenBytesNavigationView(path: navigation.home) {
                // TODO: Update to Production
                HomeScreen(
                    viewModel: HomeViewModel(
                        weatherProviding: MockWeatherProvider(),
                        locationProviding: MockLocationProvider()
                    )
                )
            }
            .tag(Tab.home)
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }

            OpenBytesNavigationView(path: navigation.search) {
                // TODO: Update to Production
                SearchLocationScreen(
                    viewModel: SearchLocationViewModel(
                        capabilities: .init(locationProviding: MockLocationProvider()),
                        input: .init()
                    )
                )
            }
            .tag(Tab.search)
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }

            OpenBytesNavigationView(path: navigation.summary) {
                // TODO: Update to Production
                SummaryScreen(
                    viewModel: SummaryViewModel(
                        weatherProviding: MockWeatherProvider(),
                        locationProviding: MockLocationProvider()
                    )
                )
            }
            .tag(Tab.summary)
            .tabItem {
                Image(systemName: "cloud.fog.circle")
                Text("Summary")
            }

            OpenBytesNavigationView(path: navigation.profile) {
                ProfileScreen()
            }
            .tag(Tab.profile)
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        Navigation.shared.use { navigation -> RootView in
            navigation.home = OpenBytesNavigationPath(id: "home.preview", isPreview: true)
            navigation.search = OpenBytesNavigationPath(id: "search.preview", isPreview: true)
            navigation.profile = OpenBytesNavigationPath(id: "profile.preview", isPreview: true)

            return RootView(navigation: navigation)
        }
    }
}
