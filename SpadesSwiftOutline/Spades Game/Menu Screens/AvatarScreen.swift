//
//  AvatarScreen.swift
//  SpadesSwiftOutline
//
//  Created by Michael Spade on 10/2/24.
//

import UIKit

class AvatarScreen: UITableViewController
{
    // MARK: - Properties
    let prefs = UserDefaults.standard

    // MARK: - IBOutlets
    @IBOutlet weak var avatar1: UIButton?
    @IBOutlet weak var avatar2: UIButton?
    @IBOutlet weak var avatar3: UIButton?
    @IBOutlet weak var avatar4: UIButton?
    @IBOutlet weak var avatar5: UIButton?
    @IBOutlet weak var avatar6: UIButton?
    @IBOutlet weak var avatar7: UIButton?
    @IBOutlet weak var avatar8: UIButton?
    @IBOutlet weak var avatar9: UIButton?
    @IBOutlet weak var avatar10: UIButton?
    @IBOutlet weak var avatar11: UIButton?
    @IBOutlet weak var avatar12: UIButton?
    @IBOutlet weak var avatar13: UIButton?
    @IBOutlet weak var avatar14: UIButton?
    @IBOutlet weak var avatar15: UIButton?
    @IBOutlet weak var avatar16: UIButton?
    @IBOutlet weak var avatar17: UIButton?
    @IBOutlet weak var avatar18: UIButton?
    @IBOutlet weak var avatar19: UIButton?
    @IBOutlet weak var avatar20: UIButton?
	@IBOutlet var avatarButtonCollection: [UIButton]?
	@IBOutlet weak var cancelButton: UIButton?

    // MARK: - Methods

    override func viewDidLoad()
    {
        super.viewDidLoad()
		
		//Close Button
		cancelButton?.layer.cornerRadius = (cancelButton?.frame.width)! / 2
		cancelButton?.layer.masksToBounds = true
		cancelButton?.layer.borderWidth = 1.0
		cancelButton?.layer.borderColor = UIColor.gray.cgColor
		
		//Avatar Selected View Setup
		let avatarInt = prefs.integer(forKey: "avatarNumber")

		//Set Avatar Boarder View
		for i in 0...19
		{
			if avatarInt - 1  == i
			{
				let myButton : UIButton? = avatarButtonCollection?[i]
				
				//Avatar Button Setup
				myButton?.layer.cornerRadius = 5
				myButton?.layer.masksToBounds = false
				myButton?.layer.borderColor = UIColor.blue.cgColor
				myButton?.layer.borderWidth = 2.0
			}
		}
    }
    
    func cancelAction()
    {
        presentingViewController?.dismiss(animated: true)
    }
	
	func clearBoarders()
	{
		//Clear Avatar Boarder View
		for i in 0...19
		{
			let myButton : UIButton? = avatarButtonCollection?[i]
			
			//Avatar Button Setup
			myButton?.layer.cornerRadius = 5
			myButton?.layer.masksToBounds = false
			myButton?.layer.borderColor = UIColor.clear.cgColor
			myButton?.layer.borderWidth = 2.0
		}
	}
    
    // MARK: - User Actions
    @IBAction func startSelected(sender: UIButton)
    {
		clearBoarders()
		
        switch sender
        {
        case avatar1:
        print("Avatar 1 Selected")
            prefs.set("pic1", forKey: "avatar")
			prefs.set(1, forKey: "avatarNumber")
			avatar1?.layer.borderColor = UIColor.blue.cgColor
			avatar1?.layer.borderWidth = 2.0
        case avatar2:
        print("Avatar 2 Selected")
            prefs.set("pic2", forKey: "avatar")
			prefs.set(2, forKey: "avatarNumber")
			avatar2?.layer.borderColor = UIColor.blue.cgColor
			avatar2?.layer.borderWidth = 2.0
        case avatar3:
        print("Avatar 3 Selected")
            prefs.set("pic3", forKey: "avatar")
			prefs.set(3, forKey: "avatarNumber")
			avatar3?.layer.borderColor = UIColor.blue.cgColor
			avatar3?.layer.borderWidth = 2.0
        case avatar4:
        print("Avatar 4 Selected")
            prefs.set("pic4", forKey: "avatar")
			prefs.set(4, forKey: "avatarNumber")
			avatar4?.layer.borderColor = UIColor.blue.cgColor
			avatar4?.layer.borderWidth = 2.0
        case avatar5:
        print("Avatar 5 Selected")
            prefs.set("pic5", forKey: "avatar")
			prefs.set(5, forKey: "avatarNumber")
			avatar5?.layer.borderColor = UIColor.blue.cgColor
			avatar5?.layer.borderWidth = 2.0
        case avatar6:
        print("Avatar 6 Selected")
            prefs.set("pic6", forKey: "avatar")
			prefs.set(6, forKey: "avatarNumber")
			avatar6?.layer.borderColor = UIColor.blue.cgColor
			avatar6?.layer.borderWidth = 2.0
        case avatar7:
        print("Avatar 7 Selected")
            
        case avatar8:
        print("Avatar 8 Selected")
            
        case avatar9:
        print("Avatar 9 Selected")
            
        case avatar10:
        print("Avatar 10 Selected")
            
        case avatar11:
        print("Avatar 11 Selected")
            
        case avatar12:
        print("Avatar 12 Selected")
            
        case avatar13:
        print("Avatar 13 Selected")
            
        case avatar14:
        print("Avatar 14 Selected")
        
        case avatar15:
        print("Avatar 15 Selected")
            
        case avatar16:
        print("Avatar 16 Selected")
            
        case avatar17:
        print("Avatar 17 Selected")
            
        case avatar18:
        print("Avatar 18 Selected")
            
        case avatar19:
        print("Avatar 19 Selected")
            
        case avatar20:
        print("Avatar 20 Selected")

        default:
            break
        }
        cancelAction()

    }
    
    @IBAction func cancel(_ sender: UIButton)
    {
        cancelAction()
    }
}
