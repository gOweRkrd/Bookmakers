import SwiftUI

final class BettingViewModel: ObservableObject {
    
    @Published var betModel: BetttingModel
    
    init(betModel: BetttingModel) {
        self.betModel = BetttingModel(win: min(betModel.win, 10),
                                 lose: min(betModel.lose, 10),
                                 draw: min(betModel.draw, 10))
    }
}
