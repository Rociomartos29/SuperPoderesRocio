//
//  HeroRepository.swift
//  SuperPoderesRocio
//
//  Created by Rocio Martos on 4/5/24.
//

import Foundation

final class HerosRepository: HerosRepositoryProtocol {
    private var network: NetworkHeros
    
    init(network: NetworkHeros) {
        self.network = network
    }
    
    func getHeros(filter: String, completion: @escaping ([SuperHero]?, Error?) -> Void) {
        network.getHeros(filter: filter, completion: completion)
    }
}
