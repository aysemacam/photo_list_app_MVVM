//
//  ListViewController.swift
//  amani_task
//
//  Created by Aysema Çam on 5.03.2024.
//

import UIKit

final class ListViewController:BaseViewController<ListViewModel> {
    private var tableView: UITableView!
    private var progressView: CustomProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModels()
        setupViews()
        addDelegates()
    }
    
    // MARK: - Configure and Setup Views
    private func setupViews() {
        view.backgroundColor = .listBckColor
        self.navigationItem.title = Constants.listTitle
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: Constants.listCellId)
        view.addSubview(tableView)
        view.addSubview(progressView)
        
        progressView.frame = self.view.bounds
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 92),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    private func addDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - Actions
extension ListViewController {
    
    private func initViewModels() {
        progressView = CustomProgressView()
        progressView.isHidden = false
        
        viewModel.fetchProducts()
        viewModel.reloadTableViewClosure = { [weak self] in
            self?.tableView.reloadData()
            self?.progressView.isHidden = true
        }
        
        viewModel.showError = { [weak self] error in
            self?.showAlert(message: error.localizedDescription)
            self?.progressView.isHidden = true
        }
    }
    
    private func openDetailVC(product: Product) {
        let v = DetailViewModel(product: product)
        let detailVC = DetailViewController(viewModel: v)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ListViewController {
    func showAlert(message: String) {
        let alert = UIAlertController(title: Constants.aletTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.alertButtonTitle, style: .default, handler: { [ weak self]_ in
            self?.navigationController?.popToRootViewController(animated: true)
        }))
        self.present(alert, animated: true)
    }
}

// MARK: - UITableViewDataSource and UITableViewDelegate methods

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAtTableView(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.listCellId) as! ListTableViewCell
        
        let cellItem = viewModel.cellItemAtTableView(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        
        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = .orangeColor.withAlphaComponent(0.45)
        cell.selectedBackgroundView = selectedBackgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellItem = viewModel.cellItemAtTableView(indexPath: indexPath) as? ListTableViewCellModel
        if let product = cellItem?.product {
            openDetailVC(product: product)
        }
    }
}




