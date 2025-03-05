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

    // MARK: - Methods

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func cancelAction()
    {
        presentingViewController?.dismiss(animated: true)
    }
    
    // MARK: - User Actions
    @IBAction func startSelected(sender: UIButton)
    {
        
        switch sender
        {
        case avatar1:
        print("Avatar 1 Selected")
            prefs.set("pic1", forKey: "avatar")
            
        case avatar2:
        print("Avatar 2 Selected")
            prefs.set("pic2", forKey: "avatar")

        case avatar3:
        print("Avatar 3 Selected")
            prefs.set("pic3", forKey: "avatar")

        case avatar4:
        print("Avatar 4 Selected")
            prefs.set("pic4", forKey: "avatar")

        case avatar5:
        print("Avatar 5 Selected")
            prefs.set("pic5", forKey: "avatar")

        case avatar6:
        print("Avatar 6 Selected")
            prefs.set("pic6", forKey: "avatar")

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
