import SwiftUI

struct BettingView: View {
    
    @ObservedObject var viewModel: BettingViewModel
    
    var body: some View {
        
        VStack(spacing: 20) {
            averageСoefficients
            winningСoefficient
            losingСoefficient
            returnСoefficient
        }
    }
    
    var averageСoefficients: some View {
        Text(R.BettingView.averageСoefficients)
            .customFont(SFProDisplay.medium, category: .large)
            .foregroundColor(Color(R.Colors.black))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - The winning coefficient

private extension BettingView {
    var winningСoefficient: some View {
        HStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color(R.Colors.lightGray))
                    .frame(width: 200, height: 10)
                Rectangle()
                    .fill(Color(R.Colors.green))
                    .frame(width: CGFloat((viewModel.betModel.win / 10) * 200), height: 10)
            }
            Spacer()
            Text(R.BettingView.winningСoefficient)
                .customFont(SFProDisplay.medium, category: .small)
                .foregroundColor(Color(R.Colors.lightGray))
                .padding(.leading ,5)
            Spacer()
            Text(String(format: "%.2f", viewModel.betModel.win))
                .customFont(SFProDisplay.medium, category: .small)
                .foregroundColor(Color(R.Colors.black))
        }
    }
}

// MARK: - The losing coefficient

private extension BettingView {
    var losingСoefficient: some View {
        HStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color(UIColor.systemGray5))
                    .frame(width: 200, height: 10)
                Rectangle()
                    .fill(Color(R.Colors.red))
                    .frame(width: CGFloat((viewModel.betModel.lose / 10) * 200), height: 10)
            }
            Spacer()
            Text(R.BettingView.losingСoefficient)
                .customFont(SFProDisplay.medium, category: .extraSmall)
                .foregroundColor(Color(R.Colors.lightGray))
                .padding(.leading ,5)
            Spacer()
            Text(String(format: "%.2f", viewModel.betModel.lose))
                .customFont(SFProDisplay.medium, category: .small)
                .foregroundColor(Color(R.Colors.black))
        }
    }
}

// MARK: - The return coefficient

private extension BettingView {
    var returnСoefficient: some View {
        HStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color(R.Colors.lightGray))
                    .frame(width: 200, height: 10)
                Rectangle()
                    .fill(Color(R.Colors.gray))
                    .frame(width: CGFloat((viewModel.betModel.draw / 10) * 200), height: 10)
            }
            Spacer()
            Text(R.BettingView.returnСoefficient)
                .customFont(SFProDisplay.medium, category: .small)
                .foregroundColor(Color(R.Colors.lightGray))
                .padding(.leading ,5)
            Spacer()
            Text(String(format: "%.2f", viewModel.betModel.draw))
                .customFont(SFProDisplay.medium, category: .small)
                .foregroundColor(Color(R.Colors.black))
        }
    }
}


struct BettingRow_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
