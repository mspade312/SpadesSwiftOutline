//
//  SettingScreen.swift
//  SpadesSwiftOutline
//
//  Created by Michael Spade on 2/19/25.
//

import UIKit

class SettingScreen: UITableViewController
{
    // MARK: - Properties

    // MARK: - IBOutlets

    // MARK: - Methods

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Setup Background View Select
        
        //Setup Wild Card Select
        
        //Setup Misdeal
        
        //Setup Game Sounds
    }
    
    // MARK: - User Actions
    
    @IBAction func cancel(_ sender: UIButton)
    {
        presentingViewController?.dismiss(animated: true)
    }
}
