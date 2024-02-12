import SwiftUI

struct СoefficientView: View {
    
    @ObservedObject var viewModel: BettingViewModel
    
    var body: some View {
        
        VStack {
            averageСoefficients
            winningСoefficient
            losingСoefficient
            returnСoefficient
        }
        .border(Color(R.Colors.black))
    }
    
    var averageСoefficients: some View {
        Text(R.CoefficientView.averageСoefficients)
            .customFont(SFProDisplay.medium, category: .large)
            .foregroundColor(Color(R.Colors.black))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.top, .leading], 10)
    }
}

// MARK: - The winning coefficient
private extension СoefficientView {
    var winningСoefficient: some View {
        HStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color(R.Colors.lightGray))
                    .frame(width: 200, height: 10)
                Rectangle()
                    .fill(Color(R.Colors.green))
                    .frame(width: CGFloat((viewModel.coefficientModel.win / 10) * 200), height: 10)
            }
            Spacer()
            Text(R.CoefficientView.winningСoefficient)
                .customFont(SFProDisplay.medium, category: .small)
                .foregroundColor(Color(R.Colors.lightGray))
                .padding(.leading ,5)
            Spacer()
            Text(String(format: "%.2f", viewModel.coefficientModel.win))
                .customFont(SFProDisplay.medium, category: .small)
                .foregroundColor(Color(R.Colors.black))
        }
        .padding(.horizontal, 10)
    }
}

// MARK: - The losing coefficient
private extension СoefficientView {
    var losingСoefficient: some View {
        HStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color(UIColor.systemGray5))
                    .frame(width: 200, height: 10)
                Rectangle()
                    .fill(Color(R.Colors.red))
                    .frame(width: CGFloat((viewModel.coefficientModel.lose / 10) * 200), height: 10)
            }
            Spacer()
            Text(R.CoefficientView.losingСoefficient)
                .customFont(SFProDisplay.medium, category: .extraSmall)
                .foregroundColor(Color(R.Colors.lightGray))
                .padding(.leading ,5)
            Spacer()
            Text(String(format: "%.2f", viewModel.coefficientModel.lose))
                .customFont(SFProDisplay.medium, category: .small)
                .foregroundColor(Color(R.Colors.black))
        }
        .padding(.horizontal, 10)
    }
}

// MARK: - The return coefficient
private extension СoefficientView {
    var returnСoefficient: some View {
        HStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color(R.Colors.lightGray))
                    .frame(width: 200, height: 10)
                Rectangle()
                    .fill(Color(R.Colors.gray))
                    .frame(width: CGFloat((viewModel.coefficientModel.refund / 10) * 200), height: 10)
            }
            Spacer()
            Text(R.CoefficientView.returnСoefficient)
                .customFont(SFProDisplay.medium, category: .small)
                .foregroundColor(Color(R.Colors.lightGray))
                .padding(.leading ,5)
            Spacer()
            Text(String(format: "%.2f", viewModel.coefficientModel.refund))
                .customFont(SFProDisplay.medium, category: .small)
                .foregroundColor(Color(R.Colors.black))
        }
        .padding([.horizontal, .bottom], 10)
    }
}


struct BettingRow_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
