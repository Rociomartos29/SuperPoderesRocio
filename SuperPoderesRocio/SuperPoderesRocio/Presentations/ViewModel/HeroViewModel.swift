//
//  HeroViewModel.swift
//  SuperPoderesRocio
//
//  Created by Rocio Martos on 29/4/24.
//

import Foundation
import Combine

final class HeroViewModel: ObservableObject {
    @Published var heroes: [SuperHero] = []
    @Published var status = Status.none
    
    private let useCase: HerosUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(useCase: HerosUseCaseProtocol = HerosUseCase()) {
        self.useCase = useCase
    }
    
    func fetchHeroes(filter: String) {
        self.status = .loading
        
        Task {
            do {
                self.heroes = try await useCase.getHeros(filter: filter)
                self.status = .loaded
            } catch {
                self.handleFailure(error)
            }
        }
    }
    
    // Manejo de errores
    private func handleFailure(_ error: Error) {
        print("Error: \(error)")
        self.status = .error(error: error.localizedDescription)
    }
}
