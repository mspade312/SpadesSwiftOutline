//
//  PlayerSelect.swift
//  SpadesSwiftOutline
//
//  Created by Michael Spade on 10/2/24.
//

import UIKit

class PlayerSelect: UITableViewController
{
    // MARK: - Properties
   
    let prefs = UserDefaults.standard

    // MARK: - IBOutlets
    
    @IBOutlet weak var winLabel1: UILabel?
    @IBOutlet weak var loseLabel1: UILabel?
    @IBOutlet weak var winLabel2: UILabel?
    @IBOutlet weak var loseLabel2: UILabel?
    @IBOutlet weak var winLabel3: UILabel?
    @IBOutlet weak var loseLabel3: UILabel?
    @IBOutlet weak var winLabel4: UILabel?
    @IBOutlet weak var loseLabel4: UILabel?
    @IBOutlet weak var winLabel5: UILabel?
    @IBOutlet weak var loseLabel5: UILabel?
    @IBOutlet weak var winLabel6: UILabel?
    @IBOutlet weak var loseLabel6: UILabel?

 
    // MARK: - Methods
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)

        var p1Wins = prefs.string(forKey: "p1Wins")
        var p1Losses = prefs.string(forKey: "p1Losses")
        var p2Wins = prefs.string(forKey: "p2Wins")
        var p2Losses = prefs.string(forKey: "p2Losses")
        var p3Wins = prefs.string(forKey: "p3Wins")
        var p3Losses = prefs.string(forKey: "p3Losses")
        var p4Wins = prefs.string(forKey: "p4Wins")
        var p4Losses = prefs.string(forKey: "p4Losses")
        var p5Wins = prefs.string(forKey: "p5Wins")
        var p5Losses = prefs.string(forKey: "p5Losses")
        var p6Wins = prefs.string(forKey: "p6Wins")
        var p6Losses = prefs.string(forKey: "p6Losses")
        
        if p1Wins == nil
        {
            p1Wins = "0"
        }
        if p2Wins == nil
        {
            p2Wins = "0"
        }
        if p3Wins == nil
        {
            p3Wins = "0"
        }
        if p4Wins == nil
        {
            p4Wins = "0"
        }
        if p5Wins == nil
        {
            p5Wins = "0"
        }
        if p6Wins == nil
        {
            p6Wins = "0"
        }
        if p1Losses == nil
        {
            p1Losses = "0"
        }
        if p2Losses == nil
        {
            p2Losses = "0"
        }
        if p3Losses == nil
        {
            p3Losses = "0"
        }
        if p4Losses == nil
        {
            p4Losses = "0"
        }
        if p5Losses == nil
        {
            p5Losses = "0"
        }
        if p6Losses == nil
        {
            p6Losses = "0"
        }
        
        winLabel1?.text = String(format: "Wins : %@", p1Wins!)
        winLabel2?.text = String(format: "Wins : %@", p2Wins!)
        winLabel3?.text = String(format: "Wins : %@", p3Wins!)
        winLabel4?.text = String(format: "Wins : %@", p4Wins!)
        winLabel5?.text = String(format: "Wins : %@", p5Wins!)
        winLabel6?.text = String(format: "Wins : %@", p6Wins!)

        loseLabel1?.text = String(format: "Losses : %@", p1Losses!)
        loseLabel2?.text = String(format: "Losses : %@", p2Losses!)
        loseLabel3?.text = String(format: "Losses : %@", p3Losses!)
        loseLabel4?.text = String(format: "Losses : %@", p4Losses!)
        loseLabel5?.text = String(format: "Losses : %@", p5Losses!)
        loseLabel6?.text = String(format: "Losses : %@", p6Losses!)

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.row == 0
        {
            prefs.set("partner1", forKey: "partner")
            toGameScreen()
        }
        else if indexPath.row == 1
        {
            prefs.set("partner2", forKey: "partner")
            toGameScreen()
        }
        else if indexPath.row == 2
        {
            prefs.set("partner3", forKey: "partner")
            toGameScreen()
        }
        else if indexPath.row == 3
        {
            prefs.set("partner4", forKey: "partner")
            toGameScreen()
        }
        else if indexPath.row == 4
        {
            prefs.set("partner5", forKey: "partner")
            toGameScreen()
        }
        else
        {
            prefs.set("partner6", forKey: "partner")
            toGameScreen()
        }
    }

    func toGameScreen()
    {
        var toGame = GameScreen()
        toGame = storyboard!.instantiateViewController(withIdentifier: "gameScreen") as! GameScreen
        toGame.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(toGame, animated: true)
    }
    
    // MARK: - User Actions
    
    @IBAction func cancel(_ sender: UIButton)
    {
        print("Back Button Clicked")
        presentingViewController?.dismiss(animated: true)
    }
    
}
