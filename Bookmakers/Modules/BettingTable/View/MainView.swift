import SwiftUI

private struct Constants {
    static let winCoefficient: CGFloat = 8.12
    static let loseCoefficient: CGFloat = 5.23
    static let drawCoefficient: CGFloat = 2.23
    
    static let winBetting: CGFloat = 20
    static let loseBetting: CGFloat = 25
    static let returnBetting: CGFloat = 30
}

struct MainView: View {
    
    let coefficientModel: [BettingModel] = [
        BettingModel(win: Constants.winCoefficient, lose: Constants.loseCoefficient, refund: Constants.drawCoefficient, winBetting: Constants.winBetting,  loseBetting: Constants.loseBetting, refundBetting: Constants.returnBetting)
    ]
    
    var body: some View {
        NavigationView { 
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(coefficientModel, id: \.self) { bet in
                        СoefficientView(viewModel: BettingViewModel(coefficientModel: bet))
                        BettingView(viewModel: BettingViewModel(coefficientModel: bet))
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.top, 20)
            }
            .navigationTitle(R.MainView.title) 
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
