//
//  Atividade.swift
//  ListaAtividades
//
//  Created by Luiz Gomes on 09/07/20.
//  Copyright © 2020 Luiz Gomes. All rights reserved.
//

import Foundation

class Atividade: Codable {
    
    let descricao: String
    let data: Date
    var feito: Bool = false
    var id: String
    
    init(descricao: String, data: Date, feito: Bool, id: String) {
    
        self.descricao = descricao
        self.data = data
        self.feito = feito
        self.id = id
    
    }
    
}
