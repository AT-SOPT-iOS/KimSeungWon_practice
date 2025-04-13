//
//  AutoLayoutPracticeViewController.swift
//  CarrotMarket
//
//  Created by 김승원 on 4/13/25.
//

import UIKit

final class AutoLayoutPracticeViewController: UIViewController {
    
    // MARK: - Properties
    
    private let screenHeight = UIScreen.main.bounds.height
    private let screenWidth = UIScreen.main.bounds.width
    
    // MARK: - UI Properties
    
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setUI()
        setLayout()
    }
}

private extension AutoLayoutPracticeViewController {
    func setStyle() {
        view.backgroundColor = .white
    }
    
    func setUI() {
        view.addSubviews(yellowView, greenView, blackView, blueView)
    }
    
    func setLayout() {
        let cellHeight = screenHeight / 4
        let cellWidth = screenWidth / 2
        
        yellowView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        yellowView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        yellowView.heightAnchor.constraint(equalToConstant: cellHeight).isActive = true
        yellowView.widthAnchor.constraint(equalToConstant: cellWidth).isActive = true
        
        greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor).isActive = true
        greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        greenView.heightAnchor.constraint(equalToConstant: cellHeight).isActive = true
        greenView.widthAnchor.constraint(equalToConstant: cellWidth).isActive = true
        
        blackView.topAnchor.constraint(equalTo: greenView.bottomAnchor).isActive = true
        blackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        blackView.heightAnchor.constraint(equalToConstant: cellHeight).isActive = true
        blackView.widthAnchor.constraint(equalToConstant: cellWidth).isActive = true
        
        blueView.topAnchor.constraint(equalTo: blackView.bottomAnchor).isActive = true
        blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        blueView.heightAnchor.constraint(equalToConstant: cellHeight).isActive = true
        blueView.widthAnchor.constraint(equalToConstant: cellWidth).isActive = true
    }
}
