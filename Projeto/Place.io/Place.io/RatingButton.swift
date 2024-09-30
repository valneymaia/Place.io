//
//  RatingButton.swift
//  Place.io
//
//  Created by Turma02-7 on 09/09/24.
//

import SwiftUI

struct RatingButton: View {
    @ObservedObject var viewModel: RatingViewModel
        let index: Int

        var body: some View {
            Image(systemName: viewModel.ratingModel.rating >= index ?
                                "star.fill" : "star")
                .foregroundColor(.orange)
                .onTapGesture {
                    viewModel.updateRating(index)
                }
        }
}
