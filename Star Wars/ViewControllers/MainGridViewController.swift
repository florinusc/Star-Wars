//
//  ViewController.swift
//  Star Wars
//
//  Created by Florin Uscatu on 14/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import UIKit

final class MainGridViewController: UIViewController, ViewModelBased {
    
    private enum Section: CaseIterable {
        case main
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Private constants
    private let padding: CGFloat = 10.0
    private let cellsPerRow: CGFloat = 2.0
    private let loadingViewController = LoadingViewController()
    
    // MARK: - Public variables
    var viewModel: MainGridViewModel!
    
    // MARK: - Private variables
    private lazy var dataSource = makeDatasource()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private functions
    private func setup() {
        setupNavigationBar()
        setupCollectionView()
        getData()
    }
    
    private func setupNavigationBar() {
        title = "Star Wars"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = dataSource
        collectionView.register(MainGridCell.self)
    }
    
    private func getData() {
        add(loadingViewController)
        viewModel.getData { [weak self] (error) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.loadingViewController.remove()
                if let error = error {
                    self.presentAlert(for: error)
                    return
                }
                self.update(with: self.viewModel.peopleViewModels)
            }
        }
    }
    
    private func makeDatasource() -> UICollectionViewDiffableDataSource<Section, MainGridCellViewModel> {
        return UICollectionViewDiffableDataSource(collectionView: collectionView) { (collectionView, indexPath, cellViewModel) -> UICollectionViewCell? in
            let cell: MainGridCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.viewModel = cellViewModel
            return cell
        }
    }
    
    private func update(with cellViewModels: [MainGridCellViewModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, MainGridCellViewModel>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(cellViewModels, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension MainGridViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let detailViewModel = viewModel.detailViewModel(at: indexPath.row) else { return }
        let detailViewController = DetailViewController.getInstance(with: detailViewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
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
