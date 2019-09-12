//
//  ViewController.swift
//  AppTableview
//
//  Created by Denilson Monteiro on 30/08/19.
//  Copyright © 2019 Denilson Monteiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var viewBackground: GradientView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backgroundCollectionView: UIView!
    @IBOutlet weak var searchView: UISearchBar!
    @IBOutlet weak var viewBackgroundRounded: RoundView!
    @IBOutlet weak var viewBackgroundSearch: RoundView!
    @IBOutlet weak var tfQuestion: UITextField!
    @IBOutlet weak var lbEmpty: UILabel!
    
    // MARK: - Variaveis
    
    var searchController: UISearchController!
    private var listFaqOriginal = Faq.generateFaqArray()
    private var filteredList = Faq.generateFaqArray()
    private let categories = ["Categoria 1", "Categoria 2", "Categoria 3", "Categoria 4"]
    private var selectedCategory = ""
    private var label = UILabel()
    
    lazy var theCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5.0
        layout.minimumInteritemSpacing = 5.0
        // note: since the labels are "auto-width-stretching", the height here defines the actual height of the cells
        layout.estimatedItemSize = CGSize(width: 100, height: 35)
        let cv  = UICollectionView(frame: .zero, collectionViewLayout: layout)
        // using lightGray for the background "fills in" the spacing, giving us "cell borders"
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        return cv
        
    }()
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfQuestion.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        configureBackgraound()
        configureShadowView()
        configureRoundSearch()
        label.text = "Nenhum resultado encontrado"
        label.textAlignment = .center
        
        // register the cell
        // theCollectionView.register(MyASCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        theCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "categoriasCollectionViewCell")
        
        // we're going to add constraints, so don't use AutoresizingMask
        theCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // add the "menu bar" to the view
        backgroundCollectionView.addSubview(theCollectionView)
        
        // pin collection view to left and right edges
        theCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        theCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // pin top of collection view to topLayoutGuide
        //        theCollectionView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        
        // set height of collection view to 30
        theCollectionView.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        theCollectionView.showsHorizontalScrollIndicator = false
    }

    // MARK: - Methods
    
    private func configureBackgraound() {
        viewBackground.firstColor = UIColor.red
        viewBackground.secondColor = UIColor.orange
        viewBackground.isHorizontal = false
    }
    
    private func configureShadowView() {
        viewBackgroundRounded.layer.shadowColor = UIColor.black.cgColor
        viewBackgroundRounded.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        viewBackgroundRounded.layer.shadowOpacity = 0.6
        viewBackgroundRounded.layer.shadowRadius = 6.0
    }
    
    private func configureRoundSearch() {
        viewBackgroundSearch.layer.borderWidth = 1
        viewBackgroundSearch.layer.cornerRadius = 25
        viewBackgroundSearch.layer.borderColor = UIColor.white.cgColor
    }
    
    private func filterTableview(param: String) {
        filteredList.removeAll()
        filteredList = listFaqOriginal.filter { $0.details.lowercased().contains(param.lowercased()) || $0.title.lowercased().contains(param.lowercased()) }
        tableView.reloadData()
    }

}

// MARK: - Tableview

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        tableView.backgroundView = filteredList.count == 0 ? lbEmpty : nil
        if filteredList.count == 0 {
            lbEmpty.isHidden = false
        } else {
            lbEmpty.isHidden = true
        }
        return filteredList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let faq = filteredList[indexPath.row]
        cell.lbTitle.text = faq.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
}

// MARK: - CollectionView

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoriasCollectionViewCell", for: indexPath) as! CollectionViewCell
        let category = categories[indexPath.row]
        
        cell.labelTitre.text = "    \(category)    "
        cell.configureRound()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCategory = categories[indexPath.row]
        filterTableview(param: selectedCategory)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // we want a 1-pt border on top, bottom and left and right edges of the collection view itself
        return UIEdgeInsets(top: 1, left: 5, bottom: 1, right: 5)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
}


extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        tfQuestion.text = ""
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        filterTableview(param: text)
        return true
    }
    
}

