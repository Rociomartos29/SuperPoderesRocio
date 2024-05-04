//
//  RootViewModel.swift
//  SuperPoderesRocio
//
//  Created by Rocio Martos on 26/4/24.
//

import Foundation
import Combine

final class RootViewModel: ObservableObject {
    @Published var status = Status.none // Estado actual
      @Published var heros: [SuperHero] = [] // Almacenar lista de héroes
      
      var cancellables = Set<AnyCancellable>()
      
      func getHeroes(filter: String) {
          self.status = .loading // Estado cargando antes de la solicitud
          
          Task {
              do {
                  // Realizar la solicitud de red
                  NetworkHeros().getHeros(filter: filter) { result, error in
                      guard let result = result else {
                          self.status = Status.error(error: "Error al buscar héroes: \(error?.localizedDescription ?? "Unknown error")")
                          return
                      }
                      
                      // Actualizar el estado y los datos
                      self.status = .loaded
                      self.heros = result
                  }
              } catch {
                  // Manejar errores
                  self.status = Status.error(error: "Error al buscar héroes: \(error.localizedDescription)")
              }
          }
      }
  }
