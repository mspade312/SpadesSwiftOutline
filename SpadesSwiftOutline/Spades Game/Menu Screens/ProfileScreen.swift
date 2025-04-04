//
//  ProfileScreen.swift
//  SpadesSwiftOutline
//
//  Created by Michael Spade on 2/19/25.
//

import UIKit

class ProfileScreen: UITableViewController, UITextFieldDelegate
{
    // MARK: - Properties
    
    let prefs = UserDefaults.standard
    var avatarNameString: String = " "

    // MARK: - IBOutlets
    
    @IBOutlet weak var avatarSelect: UIButton?
	@IBOutlet weak var currentLevelLabel: UILabel?
	@IBOutlet weak var currentXPLabel: UILabel?
    @IBOutlet weak var playerNameTextView: UITextField?

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
        
        //Setup Player Name
		
		playerNameTextView?.delegate = self
		let nameString = prefs.string(forKey: "profileName")
		if nameString == nil
		{
			playerNameTextView?.text = "New Player"
		}
		else
		{
			playerNameTextView?.text = nameString!
		}
		
        //Get Current Level
		let levelString = prefs.string(forKey: "currentLevel")
		if levelString == nil
		{
			currentLevelLabel?.text = "Level 1"
			prefs.set(currentLevelLabel?.text, forKey: "currentLevel")
		}
		else
		{
			currentLevelLabel?.text = levelString!
		}
		
        //Get Current XP
		let currentXPString = prefs.string(forKey: "currentXP")
		if currentXPString == nil
		{
			currentXPLabel?.text = "0/10"
			prefs.set(currentXPLabel?.text, forKey: "currentXP")
		}
		else
		{
			currentXPLabel?.text = currentXPString!
		}
		
        //Get Total Wins
        
        //Get Total Losses
        
        //Add Total Wins And Losses To Get Total Games Played
        
        //Setup Progress Bar Based On XP Total Vs Left
    }
	
	func saveTextName()
	{
		prefs.set(playerNameTextView?.text, forKey: "profileName")
	}
    
    // MARK: - User Actions
    
    @IBAction func cancel(_ sender: UIButton)
    {
		saveTextName()
        presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func selectAvatar(_ sender: UIButton)
    {
        print("Avatar Button Clicked")
		saveTextName()
		
        var avatarSelected = AvatarScreen()
        avatarSelected = storyboard!.instantiateViewController(withIdentifier: "avatarScreen") as! AvatarScreen
        avatarSelected.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(avatarSelected, animated: true)
    }
}
