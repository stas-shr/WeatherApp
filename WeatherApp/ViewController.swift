//
//  ViewController.swift
//  Yandex.weather
//
//  Created by Стас on 15.02.2024.
//


import UIKit
import SnapKit

class ViewController: UIViewController {

    let tableView = UITableView()

    struct Cells {
        static let mainCell = "mainCell"
        static let secondCell = "secondCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure UITableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainCell.self, forCellReuseIdentifier: Cells.mainCell)
        tableView.register(SecondCell.self, forCellReuseIdentifier: Cells.secondCell)
        tableView.separatorColor = .clear //невидимый разделитель между ячейками
        view.addSubview(tableView)

        // FIXME: - Тут кажется неправильно сделал.
//        tableView.allowsSelection = false // отмена выбора ячейки

        setupConstraints()
    }


}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 5 // Для секции 1 возвращаем 1 ячейку, для секции 2 - 5 ячеек
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Cells.mainCell, for: indexPath) as! MainCell
            let model = Model(image: UIImage(systemName: "sun.max")!, title: String(indexPath.row))
            cell.set(model: model)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Cells.secondCell, for: indexPath) as! SecondCell
            let model = Model(image: UIImage(systemName: "cloud")!, title: String(indexPath.row))
            cell.set(model: model)
            return cell
        }

    }
}


// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {

}

//MARK: - Constraints

extension ViewController {
    func setupConstraints() {
        tableView.snp.makeConstraints { maker in
            maker.top.left.right.bottom.equalToSuperview()
        }
    }
}
