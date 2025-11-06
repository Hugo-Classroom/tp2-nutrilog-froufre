import SwiftUI

struct DailySummaryView: View {
    var body: some View {
        VStack {
            addMealButton()
            Text(.dailySummaryTitle)
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading, 20)
            
            Text(.calories)
                .foregroundColor(.gray)
                .padding()
                .padding(.leading, 20)
                .frame(maxWidth: .infinity,alignment: .leading)
            HStack {
                Text("Restantes")
                    .font(.subheadline)
                    .bold()
                    .padding()
                    
                circularProgressView(progress: 0.2)
                    .padding()
                Divider().frame(maxHeight: 50)
                
                Text("Consommées")
                    .font(.subheadline)
                    .bold()
                    .frame(maxWidth: .infinity,alignment: .leading)
                
            }.background(Color.white)
                .cornerRadius(10)
                .padding()
                
                
                
        }.background(Color.dailySummaryBackground)
    }
}

#Preview {
    DailySummaryView()
}

struct addMealButton: View {
    var body: some View {
        Button {
            
        }label: {
            Image(systemName: "plus")
        }.frame(maxWidth: .infinity,alignment: .trailing)
        .padding(10)
        .foregroundColor(Color.button)
        .font(.title2)
    }
}

struct circularProgressView: View {
    var progress: Double
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 6)
                .opacity(0.3)
                .foregroundColor(.gray)

            Circle() // Progress circle
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round))
                    .foregroundColor(.green)
                    .rotationEffect(Angle(degrees: 270.0))
        }.frame(width: 30, height: 30)
    }
}
