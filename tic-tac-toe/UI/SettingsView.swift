//
//  Settings.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-04.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var schemeHolder: AppSchemeSwitcher
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                ForEach(colorSchemes, id: \.name) { scheme in
                    Button(action: {
                        schemeHolder.current = scheme
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Text(scheme.name)
                            Spacer()
                            if schemeHolder.current.name == scheme.name {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Choose Theme")
        }
    }
}

#Preview {
    SettingsView()
}
