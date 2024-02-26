import SwiftUI

struct СoefficientView: View {
    
    @ObservedObject var viewModel: BettingViewModel
    
    var body: some View {
        
        VStack {
            averageСoefficients
            coefficientBar(
                value: viewModel.bettingModel.win, 
                color: Color(R.Colors.green), 
                label: R.CoefficientView.winningСoefficient
            )
            coefficientBar(
                value: viewModel.bettingModel.lose, 
                color: Color(R.Colors.red), 
                label: R.CoefficientView.losingСoefficient
            )
            coefficientBar(
                value: viewModel.bettingModel.refund, 
                color: Color(R.Colors.gray), 
                label: R.CoefficientView.returnСoefficient
            )
        }
        .border(Color(R.Colors.black))
    }
}

// MARK: - Ui
private extension СoefficientView {
    
    var averageСoefficients: some View {
        Text(R.CoefficientView.averageСoefficients)
            .customFont(SFProDisplay.medium, category: .large)
            .foregroundColor(Color(R.Colors.black))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.top, .leading], 10)
    }
    
    func coefficientBar(value: Double, color: Color, label: String) -> some View {
        HStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color(R.Colors.lightGray))
                    .frame(width: 200, height: 10)
                Rectangle()
                    .fill(color)
                    .frame(width: CGFloat((value / 10) * 200), height: 10)
            }
            Spacer()
            Text(label)
                .customFont(SFProDisplay.medium, category: .extraSmall)
                .foregroundColor(Color(R.Colors.lightGray))
                .padding(.leading, 5)
            Spacer()
            Text(String(format: "%.2f", value))
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
