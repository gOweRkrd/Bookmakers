import SwiftUI

private struct Constants {
    static let winCoefficient: Double = 6.5
    static let loseCoefficient: Double = 4.5
    static let drawCoefficient: Double = 3.45
}

struct MainView: View {
    
    let betting: [BetttingModel] = [
        BetttingModel(win: Constants.winCoefficient, lose: Constants.loseCoefficient, draw: Constants.drawCoefficient)
    ]
    
    var body: some View {
        List {
            ForEach(betting, id: \.self) { bet in
                BettingView(viewModel: BettingViewModel(betModel: bet))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
