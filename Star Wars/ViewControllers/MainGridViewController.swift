//
//  ViewController.swift
//  Star Wars
//
//  Created by Florin Uscatu on 14/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import UIKit

final class MainGridViewController: UIViewController, ViewModelBased {
    
    // MARK: - IBOutlets
    @IBOutlet private(set) weak var collectionView: UICollectionView!
    
    // MARK: - Private constants
    private let padding: CGFloat = 10.0
    private let cellsPerRow: CGFloat = 2.0
    private let loadingViewController = LoadingViewController()
    
    // MARK: - Public variables
    var viewModel: MainGridViewModel!
    
    // MARK: - Private variables
    private lazy var dataSource = makeDatasource()
    private var isGettingData = false
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        setup()
    }
    
    // MARK: - Private functions
    private func setup() {
        setupNavigationBar()
        setupCollectionView()
        getData()
    }
    
    private func setupNavigationBar() {
        title = "Star Wars Characters"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = dataSource
        collectionView.register(MainGridCell.self)
    }
    
    private func getData() {
        guard isGettingData == false else { return }
        isGettingData = true
        add(loadingViewController)
        viewModel.getData { [weak self] (result) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.isGettingData = false
                self.loadingViewController.remove()
                switch result {
                case .failure(let error):
                    self.presentAlert(for: error)
                case .success(let viewModels):
                    self.update(with: viewModels)
                }
            }
        }
    }
    
    private func makeDatasource() -> UICollectionViewDiffableDataSource<Int, MainGridCellViewModel> {
        return UICollectionViewDiffableDataSource(collectionView: collectionView) { (collectionView, indexPath, cellViewModel) -> UICollectionViewCell? in
            let cell: MainGridCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.viewModel = cellViewModel
            return cell
        }
    }
    
    private func update(with cellViewModels: [MainGridCellViewModel]) {
        guard cellViewModels.count > 0 else { return }
        var snapshot = dataSource.snapshot()
        if snapshot.numberOfSections == 0 {
            snapshot.appendSections([0])
        }
        snapshot.appendItems(cellViewModels, toSection: 0)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension MainGridViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let detailViewModel = viewModel.detailViewModel(at: indexPath.row) else { return }
        let detailViewController = DetailViewController.getInstance(with: detailViewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == collectionView.numberOfItems(inSection: 0) - 1 {
            getData()
        }
    }
}

extension MainGridViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = (collectionView.frame.width - padding * 3) / cellsPerRow
        return CGSize(width: side, height: side)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
}

extension MainGridViewController: Storyboarded {
    static var storyboardName: String { return "Main" }
}
