//
//  PlayerSelect.swift
//  SpadesSwiftOutline
//
//  Created by Michael Spade on 10/2/24.
//

import UIKit

class PlayerSelect: UITableViewController
{
 
    // MARK: - Methods
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    }

    
    // MARK: - User Actions
    
    @IBAction func cancel(_ sender: UIButton)
    {
        print("Back Button Clicked")
        presentingViewController?.dismiss(animated: true)
    }
    
}
