//
//  AtividadeViewController.swift
//  ListaAtividades
//
//  Created by Luiz Gomes on 09/07/20.
//  Copyright © 2020 Luiz Gomes. All rights reserved.
//

import UIKit

class AtividadeViewController: UIViewController {

    @IBOutlet weak var tfDescricao: UITextField!
    @IBOutlet weak var dpData: UIDatePicker!
    
    let am = AtividadeManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dpData.minimumDate = Date()
    }
    
    @IBAction func salvarAtividade(_ sender: UIButton) {
        let id = String(Date().timeIntervalSince1970)
        let atividade = Atividade(descricao: tfDescricao.text!, data: dpData.date, feito: false, id: id)
        
        
        
        
        am.addAtividade(atividade)
        navigationController!.popViewController(animated: true)
    }
    

}
