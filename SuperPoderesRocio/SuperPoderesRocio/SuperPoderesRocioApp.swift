//
//  SuperPoderesRocioApp.swift
//  SuperPoderesRocio
//
//  Created by Rocio Martos on 24/4/24.
//

import SwiftUI

@main
struct SuperPoderesRocioApp: App {
    var hero: SuperHero? // Cambiado a opcional
        
        var vm = HeroViewModel()
        var serie = SeriesViewModel()
        
        var body: some Scene {
            WindowGroup {
                if let hero = hero { // Verificar si hero es no nulo
                    HerosListView(hero: hero, viewModel: vm, serie: serie)
                } else {
                    // Proporcionar un valor predeterminado o manejar el caso nulo de otra manera
                    Text("Hero is nil") // Por ejemplo, mostramos un mensaje de error
                }
            }
        }
    }
