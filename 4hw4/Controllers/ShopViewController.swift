//
//  ViewController.swift
//  4hw4
//
//  Created by Telegey Nurbekova on 22/02/24.
//

import UIKit

class ShopViewController: UIViewController {
    
    private var items: [Item] = []
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        updateDetails()
        
        //table view
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [tableView.topAnchor.constraint(equalTo: view.topAnchor,constant: 20),
             tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
             tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
             tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -20)
            ])
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomtTableViewCell.self, forCellReuseIdentifier: "cell")
        
        
    }
    
    private func updateDetails(){
        
        items =  [
            Item(image: "item1", name: "Furniture", quantity: "785 Items", detailImage: "detail1", detailName: "AbocoFur Modern Velvet Fabric Lazy Chair", detailPrice: "$230", detailSettings: "Office, Living Room\nYellow\nTextile, Velvet, Cotton\n25.6 x 31.5 x 37.4 inches\n20.3 Pounds"),
            Item(image: "item2", name: "Kitchenware", quantity: "645 Items", detailImage: "detail2", detailName: "Deluxe Cookware Set", detailPrice: "$195", detailSettings: "Kitchen\nBeige\nCeramic\n26.7*15.75*12.21\n10.0 Pounds"),
            Item(image: "item3", name: "Reading Table", quantity: "Inventory", detailImage: "detail3", detailName: "Modern Reading Table With Lighting", detailPrice: "$180", detailSettings: "Office, Living Room\nAs Per Design\nTextile, Velvet\n72 x 30 x 30 inches\n21 Pounds")
        ]
    }
}

extension ShopViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomtTableViewCell
        
        cell.setData(image: items[indexPath.row].image, name: items[indexPath.row].name, quantity: items[indexPath.row].quantity)
        
        return cell
    }
}

extension ShopViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = items[indexPath.row]
        let vc = DetailViewController()
        vc.item = selectedItem
        navigationController?.pushViewController(vc, animated: true)
    }
}
