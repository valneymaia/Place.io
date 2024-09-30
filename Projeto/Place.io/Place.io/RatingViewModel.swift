//
//  RatingViewModel.swift
//  Place.io
//
//  Created by Turma02-7 on 09/09/24.
//

import SwiftUI

class RatingViewModel: ObservableObject {
    @Published var ratingModel = RatingModel()

    func updateRating(_ value: Int) {
        ratingModel.rating = value
    }
}
