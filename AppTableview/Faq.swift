//
//  Faq.swift
//  AppTableview
//
//  Created by Denilson Monteiro on 30/08/19.
//  Copyright © 2019 Denilson Monteiro. All rights reserved.
//

import UIKit

class Faq: NSObject {
    
    var title: String
    var details: String
    var id: Int
    
    init(title: String, details: String, id: Int) {
        self.title = title
        self.details = details
        self.id = id
    }
    
    static func generateFaqArray() -> [Faq] {
        var array: [Faq] = []
        array.append(Faq(title: "O que é o Cartão Virtual do Cidadão?", details: "É um cartão gerado direto no seu celular, que facilita o seu acesso aos serviços dos benefícios sociais e trabalhistas, agilizando de maneira segura o processo de pagamento dos benefícios sociais.", id: 1))
        array.append(Faq(title: "Quem pode ter o Cartão Virtual do Cidadão?", details: "Todos os cidadãos, maiores de 14 anos, que tenham Senha Cidadão cadastrada podem ter o Cartão Virtual do Cidadão.",id: 2))
        array.append(Faq(title: "Quais benefícios posso sacar com meu Cartão Virtual do Cidadão?", details: "Você pode utilizar seu cartão virtual para o saque de benefícios sociais e trabalhistas, como abono salarial, rendimentos do PIS, seguro-desemprego e FGTS.", id: 3))
        array.append(Faq(title: "Onde posso utilizar o meu Cartão Virtual do Cidadão?", details: "Você pode utilizar seu cartão virtual para o saque nos terminais de autoatendimento Caixa.", id: 4))
        array.append(Faq(title: "Como posso sacar o benefício usando o Cartão Virtual do Cidadão?", details: "Em um terminal de autoatendimento você deve informar seu NIS, Senha Cidadão e o Código para Saque gerado na tela principal do seu aplicativo.", id: 5))
        array.append(Faq(title: "Existe limite de valor para saque com o Cartão Virtual do Cidadão?", details: "O cartão virtual possibilita o saque dos valores que você tem direito, por exemplo para saque do FGTS pode ser realizado o pagamento de valores entre R$ 1.500,00 e R$ 3.000,00. ", id: 6))
        array.append(Faq(title: "O Cartão Virtual do Cidadão tem validade?", details: "O Cartão Virtual do Cidadão não possui validade.", id: 7))
        array.append(Faq(title: "Eu pago alguma tarifa para utilizar o Cartão Virtual do Cidadão?", details: "Você não paga nenhuma tarifa para ter ou sacar seu benefício com o Cartão Virtual do Cidadão.", id: 8))
        array.append(Faq(title: "Como faço para recadastrar a senha do meu Cartão Virtual do Cidadão?'", details: "O Cartão Virtual do Cidadão é utilizado junto com a sua  Senha Cidadão. Caso necessite recadastrá-la, procure uma Agência da Caixa. Não se esqueça de apresentar um dos documentos abaixo: - Carteira de identidade - fornecida pelos órgãos de segurança pública; - Carteira de habilitação – novo modelo; - CTPS – Carteira de Trabalho e Previdência Social; - Carteira funcional - emitida por repartições públicas ou por órgãos de classe dos profissionais liberais, desde que tenha fé pública reconhecida por decreto; - Identidade militar - expedida pelas Forças Armadas ou Forças Auxiliares para seus membros ou dependentes; - Carteira de identidade de estrangeiros - emitida pelo Serviço de Registro de Estrangeiros da Polícia Federal; - Passaporte - emitido no Brasil ou no exterior, registrado no Serviço de Registro de Estrangeiros da Polícia Federal, quando se tratar de estrangeiro sob visto de permanência temporária pelo País.", id: 9))
        array.append(Faq(title: "O que é o Código para Saque e para que serve?", details: "O Código para Saque é um código gerado na tela principal do seu Aplicativo Cartão Virtual do Cidadão, que serve para validar os saques de benefícios com segurança.", id: 10))
        array.append(Faq(title: "Como faço para gerar o Código para Saque?", details: "O Código para Saque é gerado automaticamente na tela principal do seu Aplicativo Cartão Virtual do Cidadão. Ele será exibido somente após as validações de segurança dos dados que você forneceu no momento do cadastro.", id: 11))
        array.append(Faq(title: "Como eu utilizo o Código para Saque?", details: "Você deverá informar o Código para Saque juntamente com o seu NIS/PIS e Senha Cidadão quando solicitado no terminal de autoatendimento.", id: 12))
        array.append(Faq(title: "Preciso estar conectado à internet para visualizar o Código para Saque?", details: "Não é preciso acesso à internet ou sinal da operadora para visualizar o Código para Saque.", id: 13))
        array.append(Faq(title: "Um mesmo Código para Saque pode ser utilizado para sacar mais de um benefício?", details: "Você deve utilizar um código por transação efetuada. Não se preocupe, um novo código é gerado automaticamente.", id: 14))
        array.append(Faq(title: "Como eu vejo se existe benefício disponível para mim?", details: "Após realizar seu cadastro, caso haja, os benefícios estarão disponíveis na tela principal do seu Aplicativo.", id: 15))
        array.append(Faq(title: "Como posso consultar os benefícios que já recebi?", details: "Após realizar seu cadastro, caso haja benefícios pagos dentro da validade,  estarão disponíveis na tela principal do seu Aplicativo.", id: 16))
        array.append(Faq(title: "Posso acessar meu Cartão Virtual do Cidadão em outro smartphone?", details: "O Cartão Virtual do Cidadão só poderá ser gerado em um único smartphone.", id: 17))
        return array
    }

}
