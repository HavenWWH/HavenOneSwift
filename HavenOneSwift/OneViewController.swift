//
//  OneViewController.swift
//  ONESwift
//
//  Created by 吴文海 on 2019/4/10.
//  Copyright © 2019 吴文海. All rights reserved.
//

import UIKit

class OneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("oneVcviewDidLoad")
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("oneVcviewDidAppear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("oneVcviewWillAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
         print("oneVcviewviewDidDisappear")
    }

}
