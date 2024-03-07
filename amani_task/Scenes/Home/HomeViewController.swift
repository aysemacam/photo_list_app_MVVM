//
//  HomeViewController.swift
//  amani_task
//
//  Created by Aysema Çam on 5.03.2024.
//

import UIKit

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        setupViews()
    }
    
    // MARK: - Configure and Setup Views
    private func setupViews() {
        view.backgroundColor = .listBckColor
        self.navigationItem.title = Constants.homeTitle

        
        let containerView = UIView()
        let photoNameLabel = UILabel()
        let photoIdLabel = UILabel()
        let leftRightInset = view.frame.width * 0.05
        let topOffset = view.frame.height * 0.15
        
        containerView.backgroundColor = .orangeColor.withAlphaComponent(0.15)
        containerView.layer.cornerRadius = 15
        containerView.layer.masksToBounds = true
        containerView.layer.borderColor = UIColor.orange.cgColor
        containerView.layer.borderWidth = 2
        
        view.addSubview(containerView)
        containerView.addSubview(photoNameLabel)
        containerView.addSubview(photoIdLabel)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        photoNameLabel.translatesAutoresizingMaskIntoConstraints = false
        photoIdLabel.translatesAutoresizingMaskIntoConstraints = false
        
        photoNameLabel.text = Constants.photoName + " \(viewModel.product?.title ?? Constants.noPhotoName)"
        photoNameLabel.numberOfLines = 0
        photoNameLabel.textColor = .white
        photoNameLabel.font = UIFont.systemFont(ofSize: 18)
        
        photoIdLabel.text = Constants.photoId + " \(viewModel.product?.id != nil ? String(viewModel.product!.id) : Constants.noPhotoId)"
        photoIdLabel.numberOfLines = 0
        photoIdLabel.font = UIFont.systemFont(ofSize: 18)
        photoIdLabel.textColor = .white
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topOffset),
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: leftRightInset),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -leftRightInset),
            containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            photoNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: topOffset / 2),
            photoNameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 15),
            photoNameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -12),
            
            photoIdLabel.topAnchor.constraint(equalTo: photoNameLabel.bottomAnchor, constant: 12),
            photoIdLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 12),
            photoIdLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -12),
        ])
    }
    
    private func setupNavigationItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: Constants.homeBarButtonTitle, style: .plain, target: self, action: #selector(addListItem))
        navigationController?.navigationBar.barTintColor = .listBckColor
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
    }
}

// MARK: - Actions
extension HomeViewController {
    
    @objc func addListItem() {
        let m = ListViewModel()
        let v = ListViewController(viewModel: m)
        navigationController?.pushViewController(v, animated: true)
    }
}
