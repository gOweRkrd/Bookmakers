import SwiftUI

private enum Constants {
    static let winCoefficient: CGFloat = 8.12
    static let loseCoefficient: CGFloat = 5.23
    static let drawCoefficient: CGFloat = 2.23
    
    static let winBetting: CGFloat = 40
    static let loseBetting: CGFloat = 50
    static let returnBetting: CGFloat = 20
}

struct MainView: View {
    
    let bettingModel: [BettingModel] = [
        BettingModel(
            win: Constants.winCoefficient, 
            lose: Constants.loseCoefficient, 
            refund: Constants.drawCoefficient, 
            winBetting: Constants.winBetting,  
            loseBetting: Constants.loseBetting, 
            refundBetting: Constants.returnBetting
        )
    ]
    
    var body: some View {
        NavigationView { 
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(bettingModel, id: \.self) { bet in
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
