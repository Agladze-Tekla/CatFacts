//
//  CatFactsTableViewCell.swift
//  (Φ ᆺ Φ)
//
//  Created by Tekla on 11/19/23.
//

import UIKit
import CatFactPackage

final class CatFactsTableViewCell: UITableViewCell {

    // MARK: - Properties
    private let factLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 23)
        return label
    }()
    
    private var catFacts = [CatFactPackage.CatFacts]()
    
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
    func configure(model: CatFacts) {
        factLabel.text = model.fact
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        self.addSubview(factLabel)
        NSLayoutConstraint.activate([
            factLabel.topAnchor.constraint(equalTo: self.topAnchor),
            factLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            factLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            factLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
