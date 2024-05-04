//
//  NetworkSeries.swift
//  SuperPoderesRocio
//
//  Created by Rocio Martos on 29/4/24.
//

import Foundation
final class NetworkSeries {
    func getSeries(filter: String) async throws -> [Serie] {
        let url = URL(string: Endpoints.series.rawValue)
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethods.get
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let series = try JSONDecoder().decode(SeriesResponse.self, from: data)
        
        return series.data.results
    }
}
