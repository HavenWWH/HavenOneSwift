//
//  TwoViewController.swift
//  ONESwift
//
//  Created by 吴文海 on 2019/4/10.
//  Copyright © 2019 吴文海. All rights reserved.
//

import UIKit

class TwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("twoVcviewDidLoad")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("twoVcviewDidAppear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("twoVcviewWillAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("twoVcviewviewDidDisappear")
    }
}
