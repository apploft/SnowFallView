//
//  ViewController.swift
//  SnowFallViewExample
//
//  Copyright © 2016 Ha Nyung Chung. All rights reserved.
//

import UIKit

import SnowFallView

class ViewController: UIViewController {

    var snowFallView: SnowFallView?

    override func loadView() {
        self.snowFallView = SnowFallView()
        self.view = self.snowFallView
    }

    override func viewDidAppear(_ animated: Bool) {
        self.snowFallView?.start()
    }

    override func viewDidDisappear(_ animated: Bool) {
        self.snowFallView?.stop()
    }
}

