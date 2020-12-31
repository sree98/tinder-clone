//
//  ContentView.swift
//  Tinder
//
//  Created by Sreekuttan Sudarsanan on 12/18/20.
//

import SwiftUI
import SwiftyJSON

func getCards() -> [Card] {
    var cards = [Card]()
    let parks = Parks.json.arrayValue
    var count = 0
    
    for park in parks {
        let url = park["image"]["url"].stringValue.replacingOccurrences(of: "-", with: "_")
        let name = park["title"].stringValue
        var statesStr = ""
        let description = park["description"].stringValue
        
        for state in park["states"].arrayValue {
            if !statesStr.isEmpty {
                statesStr += ", "
            }
            statesStr.append(state["title"].stringValue)
        }
        
        cards += [Card(id: count, img: url, name: name, state: statesStr, description: description)]
        count += 1
    }
    return cards
}

struct ContentView: View {
    @State var cards = getCards()

    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(cards.count-1-id) * 10
        return geometry.size.width - offset
    }
    
    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        return  CGFloat(cards.count - 1 - id) * 10
    }
    
    private var maxID: Int {
         return self.cards.map { $0.id }.max() ?? 0
     }

    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack {
                    ForEach(self.cards, id: \.self) { card in
                        if card.id > self.maxID - 4 {
                            CardView(card: card, onRemove: {removedCard in
                                self.cards.removeAll {$0.id == removedCard.id}
                            })
                            .animation(.spring())
                            .frame(width: self.getCardWidth(geometry, id: card.id), height: 600)
                            .offset(x: 0, y: self.getCardOffset(geometry, id: card.id))
                        }
                    }
                }
                Spacer()
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
