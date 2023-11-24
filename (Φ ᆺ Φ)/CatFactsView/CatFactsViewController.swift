//
//  CatFactsViewController.swift
//  (Φ ᆺ Φ)
//
//  Created by Tekla on 11/19/23.
//

import UIKit
import CatFactPackage

final class CatFactsViewController: UIViewController {
    
    //MARK: - Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //private var catFacts = [CatFacts]()
    //private let viewModel = CatFactsViewModel()
    private var catFacts = [CatFactPackage.CatFacts]()
    private let viewModel = CatFactPackage.CatFactsViewModel()
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupViewModelDelegate()
        viewModel.viewDidLoad()
    }
    
    //MARK: - Private Methods
    private func setupView() {
        setupBackground()
        setupConstraints()
        setupTableView()
    }
    
    private func setupBackground() {
        view.backgroundColor = .init(red: 15/255, green: 80/255, blue: 15/255, alpha: 0.7)
    }
    
    private func setupConstraints() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(CatFactsTableViewCell.self, forCellReuseIdentifier: "catFactsCell")
    }
    
    private func setupViewModelDelegate() {
        viewModel.delegate = self
    }
}
// MARK: - TableView DataSource
extension CatFactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        catFacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fact = catFacts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "catFactsCell") as? CatFactsTableViewCell {
            cell.configure(model: fact)
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - CatFactsViewModelDelegate
extension CatFactsViewController: CatFactPackage.CatFactsViewModelDelegate {
    func factsFetched(_ facts: [CatFacts]) {
        self.catFacts = facts
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showError(_ error: Error) {
        print("Error")
    }
}
