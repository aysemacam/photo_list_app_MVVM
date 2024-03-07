//
//  ListCell.swift
//  amani_task
//
//  Created by Aysema Çam on 4.03.2024.
//

import UIKit

public class ListTableViewCell: UITableViewCell, ReusableView {
    
    weak var viewModel: ListTableViewCellProtocol?
    
    let titleLabel = UILabel()
    let photoImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
    }
    
    // MARK: - Configure Contents
    private func configureContents() {
        self.backgroundColor = .clear
        contentView.backgroundColor = .listCellBckColor
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(photoImageView)
        
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .white
        
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
        photoImageView.layer.cornerRadius = 20
      
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            photoImageView.widthAnchor.constraint(equalToConstant: 120),
            photoImageView.heightAnchor.constraint(equalToConstant: 120),
            
            titleLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    // MARK: - Set Model    
    public func set(viewModel: ListTableViewCellProtocol) {
        self.viewModel = viewModel
        let product = viewModel.product
        self.titleLabel.text = product.title
        self.photoImageView.setImage(product.imgURL)
    }
}
