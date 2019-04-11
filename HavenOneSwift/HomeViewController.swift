//
//  HomeViewController.swift
//  ONESwift
//
//  Created by 吴文海 on 2019/3/26.
//  Copyright © 2019 吴文海. All rights reserved.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {
    
    let cell_id = "HavenCell"
    
    var dataArray = ["1","2","2","3","4","5"]
    
    lazy var tableView: UITableView = {
        let tabView = UITableView.init(frame: self.view.bounds, style: UITableView.Style.plain)
        tabView.backgroundColor = .white
        tabView.delegate = self
        tabView.dataSource = self
        tabView.tableFooterView = UIView()
        tabView.separatorColor = .gray
         tabView.register(HavenCell.classForCoder(), forCellReuseIdentifier:cell_id)
        return tabView;
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Home"
        view.addSubview(tableView)
        
        setNav()
    }
}

//MARK: - 数据源和代理方法
extension HomeViewController: UITableViewDataSource {
    // 函数方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell: HavenCell = tableView.dequeueReusableCell(withIdentifier: cell_id, for: indexPath) as! HavenCell
        cell.setttingData(str: "\(indexPath.row)")
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let vc: HHHHHViewController = HHHHHViewController()
        vc.initController(titles: ["帅帅", "酷酷酷", "酷是","酷酷酷","酷酷酷","酷酷酷"], childs: [OneViewController(),TwoViewController(),UIViewController(),UIViewController(),UIViewController(),UIViewController()])
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }
}

//MARK: UI
extension HomeViewController {
    
    private func setNav() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .done, target: self, action: #selector(tapClick))
    }
    
    @objc fileprivate func tapClick() {
        
        navigationController?.dismiss(animated: true, completion: {
            
        })
    }
}

//MARK: 业务逻辑
extension HomeViewController {
    
    
}
