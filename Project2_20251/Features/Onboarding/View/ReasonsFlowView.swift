//
//  ReasonsFlowView.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 23/10/25.
//
import SwiftUI

struct ReasonsFlowView: View {
    @StateObject private var vm = ReasonsFlowViewModel()

    var body: some View {
        NavigationStack(path: $vm.path) {
            ReasonsScreenView(
                config: vm.config(for: .reason),
                onSelect: { vm.select($0, at: .reason) }
            )
            .navigationDestination(for: ReasonStep.self) { step in
                switch step {
                case .skill:
                    ReasonsScreenView(config: vm.config(for: .skill)) { vm.select($0, at: .skill) }
                        .transition(.move(edge: .trailing))
                case .intensity:
                    ReasonsScreenView(config: vm.config(for: .intensity)) { vm.select($0, at: .intensity) }
                        .transition(.move(edge: .trailing))
                case .track:
                    ReasonsScreenView(config: vm.config(for: .track)) { vm.select($0, at: .track) }
                        .transition(.move(edge: .trailing))
                case .reason:
                    // Không quay ngược về reason qua destination
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    ReasonsFlowView()
}
