//
//  ScrollViewPracticeViewController.swift
//  CarrotMarket
//
//  Created by 김승원 on 4/13/25.
//

import UIKit

final class ScrollViewPracticeViewController: UIViewController {

    // MARK: - UI Properties
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let redView = UIView()
    private let orangeView = UIView()
    private let yellowView = UIView()
    private let greenView = UIView()
    private let blueView = UIView()
    private let purpleView = UIView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setUI()
        setLayout()
    }
}

// MARK: - Functions

private extension ScrollViewPracticeViewController {
    func setStyle() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        redView.translatesAutoresizingMaskIntoConstraints = false
        orangeView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        
        redView.backgroundColor = .red
        orangeView.backgroundColor = .orange
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
        blueView.backgroundColor = .blue
        purpleView.backgroundColor = .purple
    }
    
    func setUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(redView, orangeView, yellowView, greenView, blueView, purpleView)
    }
    
    func setLayout() {
        let boxHeight: CGFloat = 300
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
        
        redView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        redView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        redView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
        redView.heightAnchor.constraint(equalToConstant: boxHeight).isActive = true
        
        orangeView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        orangeView.leadingAnchor.constraint(equalTo: redView.trailingAnchor).isActive = true
        orangeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        orangeView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
        orangeView.heightAnchor.constraint(equalToConstant: boxHeight).isActive = true
            
        yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor).isActive = true
        yellowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        yellowView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
        yellowView.heightAnchor.constraint(equalToConstant: boxHeight).isActive = true
            
        greenView.topAnchor.constraint(equalTo: orangeView.bottomAnchor).isActive = true
        greenView.leadingAnchor.constraint(equalTo: yellowView.trailingAnchor).isActive = true
        greenView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        greenView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
        greenView.heightAnchor.constraint(equalToConstant: boxHeight).isActive = true
            
        blueView.topAnchor.constraint(equalTo: yellowView.bottomAnchor).isActive = true
        blueView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        blueView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
        blueView.heightAnchor.constraint(equalToConstant: boxHeight).isActive = true
        
        purpleView.topAnchor.constraint(equalTo: greenView.bottomAnchor).isActive = true
        purpleView.leadingAnchor.constraint(equalTo: blueView.trailingAnchor).isActive = true
        purpleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        purpleView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
        purpleView.heightAnchor.constraint(equalToConstant: boxHeight).isActive = true
        purpleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
