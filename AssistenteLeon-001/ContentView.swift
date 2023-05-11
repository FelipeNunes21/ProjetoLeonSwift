//
//  ContentView.swift
//  AssistenteLeon-001
//
//  Created by Felipe Nunes - Andre - Ismael
//

import SwiftUI

// MARK: - Chamar Tela inicial

struct ContentView: View {
    var body: some View {
        VStack {
            TelaInicial()
        }
    }
}


// MARK: - Pergunta

struct Pergunta {
    let text: String
    let respostasPossiveis: [String] //tipo array
    let proximaPergunta: ((String) -> Int)?
    
    
}



// MARK: - ChatView

struct ChatView: View {
    
   
   // Fluxo de perguntas e respostas ---- Array
    let perguntas = [
        
    
        //0
        Pergunta(text: "Você é pessoa física ou pessoa jurídica?", respostasPossiveis: ["Pessoa Jurídica", "Pessoa Física"], proximaPergunta: { resposta in
            switch resposta {
            case "Pessoa Jurídica":
                return 3
            case "Pessoa Física":
                return 4
            default:
                return 0
            }
            
        }),
        
        //1 - Fluxo final positivo
        Pergunta(text: "Você precisa declarar imposto de renda em 2023!", respostasPossiveis: ["Recomeçar", "Mais informacões"], proximaPergunta: { resposta in
            switch resposta {
            case "Recomeçar":
                return 0
            case "Mais informacões": // colocar algum link?
                return 0
            default:
                return 0
            }
            
        }),
        
        //2 - Fluxo final negativo
        Pergunta(text: "Que legal! Você não precisa declarar imposto de renda em 2023!", respostasPossiveis: ["Recomeçar", "Mais informacões"], proximaPergunta: { resposta in
            switch resposta {
            case "Recomeçar":
                return 0
            case "Mais informacões": //colocar algum link?
                return 0
            default:
                return 0
            }
            
        }),
        
        //3 Fluxo Pessoa Juridica
        Pergunta(text: "pessoa juridica", respostasPossiveis: ["Pessoa Jurídica", "Pessoa Física"], proximaPergunta: { resposta in
            switch resposta {
            case "Pessoa Jurídica":
                return 0
            case "Pessoa Física":
                return 0
            default:
                return 0
            }
            
        }),
        
        //4 Fluxo pessoa Física
        Pergunta(text: "Qual foi a sua renda bruta anual em 2022, incluindo salários, aposentadorias, aluguéis?", respostasPossiveis: ["Menos de R$ 28.559,70", "Maior ou igual a R$ 28.559,70"], proximaPergunta: { resposta in
            switch resposta {
            case "Menos de R$ 28.559,70":
                return 2
            case "Maior ou igual a R$ 28.559,70": //Continua em 5
                return 5
            default:
                return 0
            }
            
        }),
        
        //5 xxxxx
        Pergunta(text: "Você possui algum tipo de investimento financeiro, como ações, fundos, CDBs, LCIs, LCAs, poupança, entre outros?", respostasPossiveis: ["Sim", "Não"], proximaPergunta: { resposta in
            switch resposta {
            case "Sim": // Continua em 6
                return 6
            case "Não":
                return 2
            default:
                return 0
            }
            
        }),
        
        //6 xxxxx
        Pergunta(text: "O valor total dos seus investimentos financeiros é igual ou superior a R$ 140.619,55?", respostasPossiveis: ["Sim", "Não"], proximaPergunta: { resposta in
            switch resposta {
            case "Sim":
                return 1
            case "Não": // Continue em 7
                return 8
            default:
                return 0
            }
            
        }),
        
        //7 xxxxx
        Pergunta(text: "Você vendeu algum bem, como imóvel, veículo, ou qualquer outro bem de valor, em 2022?", respostasPossiveis: ["Sim", "Não"], proximaPergunta: { resposta in
            switch resposta {
            case "Sim":
                return 8 // Continue em 8
            case "Não":
                return 1
            default:
                return 0
            }
            
        }),
        
        //8 xxxxx
        Pergunta(text: "O valor total das vendas dos seus bens em 2022 é igual ou superior a R$ 35.000,00?", respostasPossiveis: ["Sim", "Não"], proximaPergunta: { resposta in
            switch resposta {
            case "Sim":
                return 9
            case "Não":
                return 2
            default:
                return 0
            }
            
        }),
        
    //----------- More QUESTIONS --------------
        
        //9 xxxxx
        Pergunta(text: "Questão 09", respostasPossiveis: ["Sim", "Não"], proximaPergunta: { resposta in
            switch resposta {
            case "Sim":
                return 10
            case "Não":
                return 1
            default:
                return 0
            }
            
        }),
        
        //10 xxxxx
        Pergunta(text: "Questão 10", respostasPossiveis: ["Sim", "Não"], proximaPergunta: { resposta in
            switch resposta {
            case "Sim":
                return 10
            case "Não":
                return 2
            default:
                return 0
            }
            
        }),
        
        
        
    // ----------------------------------------
        
    
    ]
    
    
    @State private var indexPerguntaAtual = 0
    
    @State private var perguntaRespostas: [String: String] = [:]
    
    @State private var historico : [(String,String)] = []
    
    
    var body: some View {
        
        VStack {
            
            
// MARK-------------------Cabeçalho segunda pagina
            VStack {
                HStack {
                    
                    
                    Text("🦁")
                        .font(.system(size: 40))
                        .padding(2)
                        .overlay(
                             RoundedRectangle(cornerRadius: 100)
                                .stroke(Color.orange, lineWidth: 2))
                        
                    
                    VStack {
                        Text("Assistente Leon")
                            .font(.title3)
                            .bold()
                        
                        Text("Online")
                            .foregroundColor(.secondary)
                           
                    }
                    
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                    .padding(.bottom,  1)

                
            }
 // MARK ----------------------Texto Subindo Pelo ScrollView------
            
            
            ScrollView {
                
                VStack(alignment: .leading) {
                    ForEach(0..<historico.count, id: \.self) { index in
                        PerguntaView(pergunta: historico[index].0, resposta:
                                        historico[index].1)
                        
                    }
                    PerguntaView(pergunta: perguntas[indexPerguntaAtual].text, resposta: nil)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                .rotationEffect(.degrees(180))
                
            }.rotationEffect(.degrees(180))
                .background(Color.gray.opacity(0.10))
                .padding(.bottom, -8)
            
            
            // Parte inferior onde contém os botoes 
            ZStack {
                
                Rectangle()
                    .ignoresSafeArea()
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .foregroundColor(Color.red.opacity(0.10))
                    
                
            HStack {
                
                ForEach(0..<perguntas[indexPerguntaAtual].respostasPossiveis.count, id: \.self) { indexResposta in
                    Button(action: {
                        let resposta = perguntas[indexPerguntaAtual].respostasPossiveis[indexResposta]
                        historico.append((perguntas[indexPerguntaAtual].text,resposta))
                        
                       if let indexProximaPergunta = perguntas[indexPerguntaAtual].proximaPergunta?(resposta) {
                            indexPerguntaAtual = indexProximaPergunta
                        }
                    }) {
                        
                        
                        Text(perguntas[indexPerguntaAtual].respostasPossiveis[indexResposta])
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                            .background(perguntaRespostas[perguntas[indexPerguntaAtual].text] != nil ? Color.gray : Color.orange)
                            .cornerRadius(20)
                    }
                    .disabled(perguntaRespostas[perguntas[indexPerguntaAtual].text] != nil)
                    
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
            
            
        } //
            

            
        }
        .navigationTitle(Text("Chat"))
        
        
        
    }
                                           

    
    
}


// MARK: -
    struct PerguntaView: View {
        let pergunta: String
        let resposta: String?
        
        var body: some View {
            
            Group {
                if let resposta = resposta {//cria o hisrico subindo pergunta
                    HStack {
                        Text(pergunta)
                            .padding()
                            .background(.gray.opacity(0.15))
                            .cornerRadius(20)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                    }
                    
                    HStack {
                        HStack {// cria o historico resposta
                            Text(resposta)
                                .padding()
                                .foregroundColor(.white)
                                .background(.orange.opacity(0.8))
                                .cornerRadius(20)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            Spacer()
                        }
                        
                    }
                            
                } else {
                        HStack {
                                
                            Text(pergunta)
                                .padding()
                                .background(.gray.opacity(0.15))
                                .cornerRadius(20)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                 
                
                
            }.padding(.vertical, 10)
            
        }
    }










// MARK: - preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
