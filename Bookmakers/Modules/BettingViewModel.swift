import SwiftUI

final class BettingViewModel: ObservableObject {
    
    @Published var coefficientModel: BettingModel
    
    init(coefficientModel: BettingModel) {
        self.coefficientModel = BettingModel(
            win: min(coefficientModel.win, 10),
            lose: min(coefficientModel.lose, 10),
            refund: min(coefficientModel.refund, 10), 
            winBetting: coefficientModel.winBetting,
            loseBetting: coefficientModel.loseBetting,
            refundBetting: coefficientModel.refundBetting
        )
    }
    
    var total: Double {
        return Double(coefficientModel.winBetting + coefficientModel.loseBetting + coefficientModel.refundBetting)
    }
    
    var winPercentage: Int {
        return Int((Double(coefficientModel.winBetting) / total) * 100)
    }
    
    var losePercentage: Int {
        return Int((Double(coefficientModel.loseBetting) / total) * 100)
    }
    
    var refundPercentage: Int {
        return Int((Double(coefficientModel.refundBetting) / total) * 100)
    }
}
