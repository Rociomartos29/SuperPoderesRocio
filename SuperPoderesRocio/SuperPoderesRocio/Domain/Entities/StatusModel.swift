//
//  StatusModel.swift
//  SuperPoderesRocio
//
//  Created by Rocio Martos on 26/4/24.
//

import Foundation
enum Status {
    case none, loading, loaded, register, error(error: String)
}
