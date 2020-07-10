//
//  AtividadeManager.swift
//  ListaAtividades
//
//  Created by Luiz Gomes on 09/07/20.
//  Copyright © 2020 Luiz Gomes. All rights reserved.
//

import Foundation

class AtividadeManager {
    static let shared = AtividadeManager()
    let ud = UserDefaults.standard
    var atividades: [Atividade] = []
    
    private init() {
        if let data = ud.data(forKey: "atividades"), let atividades = try? JSONDecoder().decode([Atividade].self, from: data) {
            self.atividades = atividades
        }
    }
    
    func salvarAtividade() {
        if let data = try? JSONEncoder().encode(atividades) {
            ud.set(data,forKey: "atividades")
        }
    }
    
    func addAtividade(_ atividade: Atividade) {
        atividades.append(atividade)
        salvarAtividade()
    }
    
    func deletaAtividade(at index: Int) {
        atividades.remove(at: index)
        salvarAtividade()
    }
    
}
