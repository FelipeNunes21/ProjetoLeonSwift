//
//  TelaInicial.swift
//  AssistenteLeon-001
//
//  Created by Luana.
//

import SwiftUI

struct TelaInicial: View {
    var body: some View {
        
        
        NavigationView {
            
            VStack {
                
                Text("🦁")
                    .font(.system(size: 150))
                Image(systemName: "bubble.right.fill")
                    .foregroundColor(.orange)
                Text("Olá!") . font(.system(size: 22))
                Text("Eu sou o Leon e estou aqui para te ajudar a descobrir se você precisa declarar imposto de renda.\n Vamos começar?")
                    .multilineTextAlignment(.center)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .center)
                    .font(.system(.title3))
                    .tracking(0.6)
                    .padding(.horizontal, 50)
                
                NavigationLink(destination: ChatView(), label: {
                    Text("Vamos lá!")
                        .font(.system(size: 25))
                        .padding()
                })
                
                
            }
        }
    }
    
}
    
    
    // MARK: - Preview
    
    struct ChatView_Previews: PreviewProvider {
        static var previews: some View {
            TelaInicial()
        }
    }
