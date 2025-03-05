//
//  ProfileScreen.swift
//  SpadesSwiftOutline
//
//  Created by Michael Spade on 2/19/25.
//

import UIKit

class ProfileScreen: UITableViewController
{
    // MARK: - Properties
    
    let prefs = UserDefaults.standard
    var avatarNameString: String = " "

    // MARK: - IBOutlets
    
    @IBOutlet weak var avatarSelect: UIButton?

    // MARK: - Methods

    override func viewDidLoad()
    {
        super.viewDidLoad()        
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        //Setup Avatar Photo
        let avatarString = prefs.string(forKey: "avatar")
        if avatarString == nil
        {
            avatarNameString = "pic3"
        }
        else
        {
            avatarNameString = avatarString!
        }
        let avatarImage = UIImage(named: avatarNameString)
        avatarSelect?.setImage(avatarImage, for: .normal)
    }
    
    // MARK: - User Actions
    
    @IBAction func cancel(_ sender: UIButton)
    {
        presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func selectAvatar(_ sender: UIButton)
    {
        print("Avatar Button Clicked")
        
        var avatarSelected = AvatarScreen()
        avatarSelected = storyboard!.instantiateViewController(withIdentifier: "avatarScreen") as! AvatarScreen
        avatarSelected.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(avatarSelected, animated: true)
    }
}
