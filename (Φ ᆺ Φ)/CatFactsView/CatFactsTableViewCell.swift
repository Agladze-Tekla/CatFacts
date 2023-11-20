//
//  CatFactsTableViewCell.swift
//  (Φ ᆺ Φ)
//
//  Created by Tekla on 11/19/23.
//

import UIKit

final class CatFactsTableViewCell: UITableViewCell {

    // MARK: - Properties
    private let factLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var catFacts = [CatFacts]()
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PrepareForReuse
    override func prepareForReuse() {
        super.prepareForReuse()
        
        factLabel.text = nil
    }
    
    // MARK: - Configure
    //TODO: - Fix this mess.
    func configure(model: CatFacts) {
        //factLabel.text = model.fact
        factLabel.text = "Hii"
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            factLabel.topAnchor.constraint(equalTo: self.topAnchor),
            factLabel.leadingAnchor.constraint(equalTo: self.leftAnchor),
            factLabel.trailingAnchor.constraint(equalTo: self.rightAnchor),
            factLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
