//
//  HHHHHViewController.swift
//  ONESwift
//
//  Created by 吴文海 on 2019/4/1.
//  Copyright © 2019 吴文海. All rights reserved.
//

import UIKit

let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width
let statusBarHeight = UIApplication.shared.statusBarFrame.height
let navigationHeight = (statusBarHeight + 44)
let titleHeight = CGFloat(44.0)

class HHHHHViewController: UIViewController {
    
    var titleS: NSArray!
    var selectBtn: UIButton = UIButton()
    var childVcs: NSMutableArray!
    var previousVc: UIViewController!
    var previousIndex: Int = -1
    var startOffsexX: CGFloat = 0.0
    var allButtonsWidth = 0.0
    
    
    
    lazy var titleScrollView: UIScrollView = {
      
        let scrollV = UIScrollView.init(frame: CGRect(x: 0, y: navigationHeight, width: self.view.frame.size.width, height: titleHeight))
        scrollV.backgroundColor = .white
        scrollV.contentSize = CGSize(width: self.view.frame.size.width * 2, height: 0)
        scrollV.showsHorizontalScrollIndicator = false
        return scrollV
    }()
    
    lazy var vcScrollView: UIScrollView = {
        
        let scrollV = UIScrollView.init(frame: CGRect(x: 0, y: titleScrollView.frame.maxY, width: self.view.frame.size.width, height: kScreenHeight - titleHeight - navigationHeight))
        scrollV.backgroundColor = .white
        scrollV.isPagingEnabled = true
        scrollV.contentSize = CGSize(width: self.view.frame.size.width * CGFloat(titleS.count), height: 0)
        scrollV.delegate = self
        return scrollV
    }()
    
    
    func initController(titles: NSArray, childs: NSMutableArray) {
        
        childVcs = childs
        titleS = titles
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "tab exchange"
        self.view.backgroundColor = .white
        
        view.addSubview(titleScrollView)
        view.addSubview(vcScrollView)
        
        setUpButtons()
    }
}


extension HHHHHViewController {
    
    fileprivate func setUpButtons() {
        
        var preBtn = UIButton()
        for (index, _)  in titleS.enumerated() {
            
            let x: CGFloat = 20.0
            let btn: UIButton = UIButton.init(type: .custom)
            btn.tag = index + 1000
            btn.setTitleColor(.white, for: .normal)
            btn.setTitle(titleS[index] as? String, for: .normal)
            btn.setTitleColor(.black, for: .selected)
            btn.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
            btn.sizeToFit()
            btn.backgroundColor = .lightGray
            btn.layer.masksToBounds = true;
            btn.layer.cornerRadius = btn.frame.size.height / 2.0
            
            btn.frame.origin.x = preBtn.frame.maxX + x;
            btn.frame.origin.y = (titleScrollView.frame.size.height - btn.frame.size.height) / 2.0
            preBtn = btn;
            titleScrollView.addSubview(btn)
      
            if index == titleS.count - 1 {
                
                titleScrollView.contentSize = CGSize(width: btn.frame.maxX + x, height: titleScrollView.frame.size.height)
                allButtonsWidth = Double(btn.frame.maxX + x)
            }
            if index == 0 {
                
                btnClick(btn: btn)
            }
        }
    }
    
    
    @objc fileprivate func btnClick(btn:UIButton) {
        
        let index: Int = btn.tag - 1000
        
        if previousIndex == index { return}
        
        vcScrollView.setContentOffset(CGPoint(x: CGFloat(index) * vcScrollView.bounds.size.width, y: vcScrollView.contentOffset.y), animated: false)
        
        showChildVc(index: index, isClick: true)
        exChangeTitleBtn(index: index)
    
    }
    
    // 切换子控制器
    fileprivate func showChildVc(index: Int, isClick: ObjCBool) {
    
        if previousIndex == index { return }
        
        let offx: CGFloat = vcScrollView.contentOffset.x
        if startOffsexX != offx { // 执行上个控制器viewWillDisappear
            previousVc.beginAppearanceTransition(false, animated: false)
        }
    
        let childVc: UIViewController = childVcs[Int(index)] as! UIViewController
    
        var firstAdd = false
        if !self.children.contains(childVc) {
            
            self.addChild(childVc)
            childVc.view.backgroundColor = UIColor.randomColor
            firstAdd = true
        }
        
        // 执行当前VC的viewWillAppear
        if previousVc != nil {
            childVc.beginAppearanceTransition(true, animated: false)
        }
        if firstAdd {
            vcScrollView.addSubview(childVc.view)
            childVc.view.frame = CGRect(x: CGFloat(index) * vcScrollView.bounds.size.width, y: 0, width: vcScrollView.bounds.size.width, height: vcScrollView.bounds.size.height)
            childVc.didMove(toParent: self)
        }
    
        // 执行上个子控制器的 viewDidDisappear 方法
        if startOffsexX != offx {
            previousVc.endAppearanceTransition()
        }
        
        // 执行当前VC的viewDidAppear
        if previousVc != nil {
            childVc.endAppearanceTransition()
        }
        previousVc = childVc
        previousIndex = index;
        if isClick.boolValue {
            startOffsexX = offx
        } else {
            startOffsexX = vcScrollView.frame.size.width * CGFloat(index)
        }
    
       
    }
    
    // 切换title按钮
    fileprivate func exChangeTitleBtn(index: Int){
        
        let btn: UIButton = view.viewWithTag(Int(index + 1000)) as! UIButton
        selectBtn.isSelected = false
        btn.isSelected = !btn.isSelected;
        selectBtn = btn
        
        var btnOffx = btn.center.x - titleScrollView.frame.size.width * 0.5
        if btnOffx < 0.0 {
            btnOffx = 0.0
        }
        let maxOffx = titleScrollView.contentSize.width - titleScrollView.frame.size.width
        if btnOffx > maxOffx {
            btnOffx = maxOffx
        }
        UIView.animate(withDuration: 0.25) {
            self.titleScrollView.contentOffset.x = btnOffx
        }
    }
}

// MARK: - ScrollViewDeleagte代理
extension HHHHHViewController: UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
       startOffsexX = scrollView.contentOffset.x
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let index = scrollView.contentOffset.x / vcScrollView.frame.size.width
        showChildVc(index: Int(index), isClick: false)
        exChangeTitleBtn(index: Int(index))
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
    }
}

extension UIColor {
    //返回随机颜色
    class var randomColor:UIColor{
        get
        {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}

