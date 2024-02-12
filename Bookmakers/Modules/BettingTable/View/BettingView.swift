import SwiftUI

struct BettingView: View {
    
    @ObservedObject var viewModel: BettingViewModel
    
    var body: some View {
        VStack {
            winLoseBookmakers
            numberOfbets
            bettingScale
        }
        .border(Color(R.Colors.black))
    }
}

// MARK: - Ui

private extension BettingView {
    var winLoseBookmakers: some View {
        Text(R.BettingView.winLoseBookmakers)
            .customFont(SFProDisplay.medium, category: .medium)
            .foregroundColor(Color(R.Colors.black))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 15)
            .padding(.leading, 10)
    }
    
    var numberOfbets: some View {
        HStack {
            Image("Betting")
                .resizable()
                .frame(width: 100, height: 20)
            totalBetting
            betting
        }
        .padding(.top, 15)
        .padding(.leading, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var totalBetting: some View {
        Text(String(format: "%.f", viewModel.total))
            .customFont(SFProDisplay.medium, category: .small)
            .foregroundColor(Color(R.Colors.black))
            .padding(.leading, 10)
    }
    
    var betting: some View {
        Text(R.BettingView.bettings)
            .customFont(SFProDisplay.medium, category: .large)
            .foregroundColor(Color(R.Colors.black))
    }
}

// MARK: - All betting

private extension BettingView {
    var bettingScale: some View {
        GeometryReader { geometry in
            let totalPercentage = viewModel.winPercentage + viewModel.losePercentage + viewModel.refundPercentage
            let totalWidth = (CGFloat(totalPercentage) / 100) * geometry.size.width 
            let winWidth = (CGFloat(viewModel.winPercentage) / 100) * totalWidth
            let loseWidth = (CGFloat(viewModel.losePercentage) / 100) * totalWidth
            let returnWidth = (CGFloat(viewModel.refundPercentage) / 100) * totalWidth
            
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color(R.Colors.green))
                    .frame(width: winWidth, height: 10)
                Rectangle()
                    .fill(Color(R.Colors.red))
                    .frame(width: loseWidth, height: 10)
                    .offset(x: winWidth + 5)
                
                Rectangle()
                    .fill(Color(R.Colors.gray))
                    .frame(width: returnWidth, height: 10)
                    .offset(x: winWidth + loseWidth + 10) 
                
                VStack {
                    totalBettingWinPercent
                        .offset(x: 0, y: 40)
                    totalBettingLosingPercent
                        .offset(x: winWidth + 5, y: 23)
                    totalBettingReturnPercent
                        .offset(x: geometry.size.width - winWidth + 25, y: 6)
                }
            }
            .frame(height: 10)
        }
        .padding([.top, .horizontal], 10)
        .padding(.bottom ,35)
    }
}

// MARK: - Win betting
private extension BettingView {
    var totalBettingWinPercent: some View {
        HStack(spacing: 5) {
            Text("\(Int(viewModel.coefficientModel.winBetting))")
                .customFont(SFProDisplay.medium, category: .small)
                .foregroundColor(Color(R.Colors.black))
            Text("(\(Int(viewModel.winPercentage))%)")
                .customFont(SFProDisplay.medium, category: .small)
                .foregroundColor(Color(R.Colors.black))
        }
    }
}


// MARK: - Lose betting
private extension BettingView {
    var totalBettingLosingPercent: some View {
        HStack(spacing: 5) {
            Text("\(Int(viewModel.coefficientModel.loseBetting))")
                .customFont(SFProDisplay.medium, category: .small)
                .foregroundColor(Color(R.Colors.black))
            Text("(\(Int(viewModel.losePercentage))%)")
                .customFont(SFProDisplay.medium, category: .small)
                .foregroundColor(Color(R.Colors.black))
        }
    }
}

// MARK: - Return betting
private extension BettingView {
    var totalBettingReturnPercent: some View {
        HStack(spacing: 5)  {
            Text("\(Int(viewModel.coefficientModel.refundBetting))")
                .customFont(SFProDisplay.medium, category: .small)
                .foregroundColor(Color(R.Colors.black))
            Text("(\(Int(viewModel.refundPercentage))%)")
                .customFont(SFProDisplay.medium, category: .small)
                .foregroundColor(Color(R.Colors.black))
        }
    }
}


struct BettingView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
