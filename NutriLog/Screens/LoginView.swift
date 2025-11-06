import SwiftUI
import LocalAuthentication

struct LoginView: View {
    
    @State private var isAuthentificated: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Image("nutrilog-logo").resizable().scaledToFit()
            if isAuthentificated {
                DailySummaryView()
            } else {
                Button {
                    authenticate()
                } label: {
                    Image(systemName: "faceid")
                    Text(.seConnecter)
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 8)
                .background(Color.button)
                .cornerRadius(6)
                .foregroundColor(.white)
               
            }
            
            Spacer()
        }.background(Color.background)
            .onAppear() {
                authenticate()
            }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if  context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Authentification required to access this section"
            
            context.evaluatePolicy(
                .deviceOwnerAuthenticationWithBiometrics,localizedReason: reason) {
                    success, error in
                    if let error {
                        print(error)
                        return
                    }
                    if success {
                        print("Authentification successful")
                    }
                    isAuthentificated = true
            }
        }
    }

}

#Preview {
    LoginView()
}

struct ConnexionButtonView: View {
    var isAuthen: Bool
    var body: some View {
        
    }
    
    
}


