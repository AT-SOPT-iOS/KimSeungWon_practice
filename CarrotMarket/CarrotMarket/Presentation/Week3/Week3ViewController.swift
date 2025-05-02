//
//  Week3ViewController.swift
//  CarrotMarket
//
//  Created by 김승원 on 4/26/25.
//

import UIKit

import SnapKit
import Then

class Week3ViewController: UIViewController {
    
    // MARK: - Properties
    
    private let chatList = Week3Model.dummy()
    
    // MARK: - UI Properties
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setUI()
        setLayout()
        
        setRegister()
        setDelegate()
    }
    
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setUI() {
        view.addSubview(tableView)
    }
    
    private func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setRegister() {
        tableView.register(Week3TableViewCell.self, forCellReuseIdentifier: Week3TableViewCell.identifier)
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDelegate

extension Week3ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

// MARK: - UITableViewDataSource

extension Week3ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Week3TableViewCell.identifier,
            for: indexPath
        ) as? Week3TableViewCell else {
            return UITableViewCell()
        }
        cell.dataBind(chatList[indexPath.row])
        return cell
    }
}
