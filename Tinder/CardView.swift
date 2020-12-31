//
//  CardView.swift
//  Tinder
//
//  Created by Sreekuttan Sudarsanan on 12/30/20.
//

import SwiftUI

struct CardView: View {
    @State private var translation: CGSize = .zero
    let card: Card
    var onRemove: (_ card: Card) -> Void
    var thresholdPercentage: CGFloat = 0.5
    
    init(card: Card, onRemove: @escaping (_ card: Card) -> Void) {
        self.card = card
        self.onRemove = onRemove
    }
    
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
    }

    
    var body: some View {
        GeometryReader { geometry in

            VStack(alignment: .leading) {

                Image(card.img)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height*0.75)
                    .clipped()
                
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(card.name)
                            .font(.title)
                            .bold()
                        Text(card.state)
                            .font(.subheadline)
                            .bold()
                        Text(card.description)
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .animation(.interactiveSpring())
            .offset(x: self.translation.width, y: 0)
            .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .bottom)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.translation = value.translation
                    }.onEnded { value in
                        if abs(self.getGesturePercentage(geometry, from: value)) > self.thresholdPercentage {
                            self.onRemove(self.card)
                        } else {
                            self.translation = .zero
                        }
                    })
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example,
                 onRemove: { _ in
                    
                 })
            .frame(height:500)
            .padding()
    }
}
