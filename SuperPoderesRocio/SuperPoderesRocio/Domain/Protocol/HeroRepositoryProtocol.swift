//
//  HeroRepositoryProtocol.swift
//  SuperPoderesRocio
//
//  Created by Rocio Martos on 4/5/24.
//

import Foundation
protocol HerosRepositoryProtocol{
    func getHeros(filter: String, completion: @escaping ([SuperHero]?, Error?) -> Void)
}
