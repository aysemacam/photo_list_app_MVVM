//
//  DetailViewController.swift
//  amani_task
//
//  Created by Aysema Çam on 5.03.2024.
//

import UIKit

final class DetailViewController: BaseViewController<DetailViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = Constants.detailTitle
        setupViews()
    }
    
    // MARK: - Configure and Setup Views
    private func setupViews() {
        view.backgroundColor = .listBckColor
        
        let photoImgView = UIImageView()
        let photoNameLabel = UILabel()
        let photoDesLabel = UILabel()
        let goHomeButton = UIButton()
        let leftRightInset = view.frame.width * 0.05
        let topOffset = view.frame.height * 0.05
        
        view.addSubview(photoImgView)
        view.addSubview(photoNameLabel)
        view.addSubview(photoDesLabel)
        view.addSubview(goHomeButton)
        
        photoImgView.translatesAutoresizingMaskIntoConstraints = false
        photoNameLabel.translatesAutoresizingMaskIntoConstraints = false
        photoDesLabel.translatesAutoresizingMaskIntoConstraints = false
        goHomeButton.translatesAutoresizingMaskIntoConstraints = false
        
        photoImgView.setImage(viewModel.product?.imgURL)
        photoImgView.contentMode = .scaleAspectFit
        
        photoNameLabel.text = viewModel.product?.title
        photoNameLabel.textColor = .white
        photoNameLabel.textAlignment = .center
        photoNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        photoNameLabel.numberOfLines = 0
        
        photoDesLabel.text = viewModel.product?.description
        photoDesLabel.textColor = .lightGray
        photoDesLabel.font = UIFont.systemFont(ofSize: 15)
        photoDesLabel.numberOfLines = 0
        
        goHomeButton.setTitle(Constants.goHomeTitle, for: .normal)
        goHomeButton.backgroundColor = .orangeColor.withAlphaComponent(0.15)
        goHomeButton.layer.borderColor = UIColor.orangeColor.cgColor
        goHomeButton.layer.borderWidth = 1
        goHomeButton.layer.cornerRadius = 15
        goHomeButton.layer.masksToBounds = true
        goHomeButton.setTitleColor(.white, for: .normal)
        goHomeButton.addTarget(self, action: #selector(goHomeButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            photoImgView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topOffset),
            photoImgView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: leftRightInset),
            photoImgView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -leftRightInset),
            photoImgView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            photoNameLabel.topAnchor.constraint(equalTo: photoImgView.bottomAnchor, constant: 24),
            photoNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: leftRightInset),
            photoNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -leftRightInset),
            
            photoDesLabel.topAnchor.constraint(equalTo: photoNameLabel.bottomAnchor, constant: 12),
            photoDesLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: leftRightInset),
            photoDesLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -leftRightInset),
            
            goHomeButton.topAnchor.constraint(equalTo: photoDesLabel.bottomAnchor, constant: 24),
            goHomeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: leftRightInset),
            goHomeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -leftRightInset),
            goHomeButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            goHomeButton.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
        ])
    }
}

// MARK: - Actions
extension DetailViewController {
    
    @objc func goHomeButtonTapped() {
        let homeViewModel = HomeViewModel(product: viewModel.product)
        let detailVC = HomeViewController(viewModel: homeViewModel)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}


