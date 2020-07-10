//
//  AtividadesTableViewController.swift
//  ListaAtividades
//
//  Created by Luiz Gomes on 09/07/20.
//  Copyright © 2020 Luiz Gomes. All rights reserved.
//

import UIKit

class AtividadesTableViewController: UITableViewController {

    let am = AtividadeManager.shared
    let dateFormater: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yy HH:mm"
        return df
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func addAtividade(_ sender: UIBarButtonItem) {
        let atividadeViewController = AtividadeViewController(nibName: "AtividadeViewController", bundle: nil)
        navigationController?.pushViewController(atividadeViewController, animated: true)
    }
    
    // MARK: - Table view data source

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return am.atividades.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let atividade = am.atividades[indexPath.row]
        cell.textLabel?.text = atividade.descricao
        cell.detailTextLabel?.text = dateFormater.string(from: atividade.data)
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            am.deletaAtividade(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }

    

}
