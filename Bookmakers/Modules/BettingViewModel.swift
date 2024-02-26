import SwiftUI

final class BettingViewModel: ObservableObject {
    
    @Published var bettingModel: BettingModel
    
    init(coefficientModel: BettingModel) {
        self.bettingModel = BettingModel(
            win: min(coefficientModel.win, 10),
            lose: min(coefficientModel.lose, 10),
            refund: min(coefficientModel.refund, 10), 
            winBetting: coefficientModel.winBetting,
            loseBetting: coefficientModel.loseBetting,
            refundBetting: coefficientModel.refundBetting
        )
    }
    
    var total: Double {
        Double(bettingModel.winBetting + bettingModel.loseBetting + bettingModel.refundBetting)
    }
    
    var winPercentage: Int {
        Int((Double(bettingModel.winBetting) / total) * 100)
    }
    
    var losePercentage: Int {
        Int((Double(bettingModel.loseBetting) / total) * 100)
    }
    
    var refundPercentage: Int {
        Int((Double(bettingModel.refundBetting) / total) * 100)
    }
}
