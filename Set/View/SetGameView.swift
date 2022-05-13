//
//  SetGameView.swift
//  Set
//
//  Created by YesVladess on 13.05.2022.
//

import SwiftUI

struct SetGameView: View {

    @ObservedObject var game: SetGameViewModel

    var body: some View {
        VStack {
            VStack {
                Text("Set!")
                    .padding(.bottom)
                    .font(.largeTitle)
                Spacer()
                AspectVGrid(items: game.cards, aspectRatio: DrawingConstants.cardsAspectRatio) { card in
                    cardView(for: card)
                }
            }
            Spacer()
            HStack(alignment: .firstTextBaseline, spacing: DrawingConstants.bottomElementsSpacing) {
                newGameButton.padding(.horizontal)
                gameInfoView.padding(.horizontal)
            }
            .padding(.horizontal)
        }
    }

    @ViewBuilder
    private func cardView(for card: SetGame.Card) -> some View {
        CardView(card: card)
            .onTapGesture {
                game.choose(card)
            }
            .padding(DrawingConstants.cardPadding)

    }

    private var newGameButton: some View {
        Button {
            game.newGame()
        } label: {
            VStack {
                Image(systemName: "plus.rectangle.fill").font(.largeTitle)
                Text("New game")
            }
        }
    }

    private var gameInfoView: some View {
        VStack {
            Text("Points: \(game.score)")
        }
    }

    private struct DrawingConstants {
        static let cardsAspectRatio: CGFloat = 2/3
        static let cardPadding: CGFloat = 4
        static let bottomElementsSpacing: CGFloat = 25
    }
}

struct SetGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameViewModel()
        SetGameView(game: game)
    }
}