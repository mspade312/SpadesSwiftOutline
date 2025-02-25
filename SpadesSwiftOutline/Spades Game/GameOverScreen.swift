//
//  GameOverScreen.swift
//  SpadesSwiftOutline
//
//  Created by Michael Spade on 10/2/24.
//

import UIKit

class GameOverScreen: UIViewController
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
    
    @IBAction func toHomeScreen(_ sender: UIButton)
    {
        print("Home Button Clicked")
        var toHome = HomeScreen()
        toHome = storyboard!.instantiateViewController(withIdentifier: "homeScreen") as! HomeScreen
        toHome.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(toHome, animated: true)
        //view.window?.rootViewController?.dismiss(animated: false, completion: nil)
    }
    
}
