//
//  ModelData.swift
//  Landmark
//
//  Created by Amby on 26/09/2022.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var landmarks: [LandMark] = load("landmarkData.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldnt find \(filename) in main bundle")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("couldnt load\(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("couldnt parse\(filename) as \(T.self):\n\(error)")
    }
}
