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
	
	@IBOutlet weak var view1: UIView?
	@IBOutlet weak var view2: UIView?
	@IBOutlet weak var view3: UIView?
	@IBOutlet weak var view4: UIView?
	@IBOutlet weak var view5: UIView?
	@IBOutlet weak var view6: UIView?
	@IBOutlet var cellViewCollection: [UIView]?
	
	@IBOutlet weak var label1: UILabel?
	@IBOutlet weak var label2: UILabel?
	@IBOutlet weak var label3: UILabel?
	@IBOutlet weak var label4: UILabel?
	@IBOutlet weak var label5: UILabel?
	@IBOutlet weak var label6: UILabel?
	@IBOutlet var titleLabelCollection: [UILabel]?
	
	@IBOutlet weak var image1: UIImageView?
	@IBOutlet weak var image2: UIImageView?
	@IBOutlet weak var image3: UIImageView?
	@IBOutlet weak var image4: UIImageView?
	@IBOutlet weak var image5: UIImageView?
	@IBOutlet weak var image6: UIImageView?
	@IBOutlet var imageViewCollection: [UIImageView]?

 
    // MARK: - Methods
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
		
		//Setup Cell Color Array
		
		//Blue Gradient
		let colorTopBlue =  UIColor(red: 60.0/255.0, green: 165.0/255.0, blue: 255.0/255.0, alpha: 0.15).cgColor
		let colorBottomBlue = UIColor(red: 60.0/255.0, green: 165.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
		
		//Purple Gradient
		let colorTopPurple =  UIColor(red: 104.0/255.0, green: 60.0/255.0, blue: 158.0/255.0, alpha: 0.15).cgColor
		let colorBottomPurple = UIColor(red: 104.0/255.0, green: 60.0/255.0, blue: 158.0/255.0, alpha: 1.0).cgColor
		
		//Red Gradient
		let colorTopRed =  UIColor(red: 158.0/255.0, green: 20.0/255.0, blue: 70.0/255.0, alpha: 0.15).cgColor
		let colorBottomRed = UIColor(red: 158.0/255.0, green: 20.0/255.0, blue: 70.0/255.0, alpha: 1.0).cgColor
		
		//Orange Gradient
		let colorTopOrange =  UIColor(red: 158.0/255.0, green: 81.0/255.0, blue: 15.0/255.0, alpha: 0.15).cgColor
		let colorBottomOrange = UIColor(red: 158.0/255.0, green: 81.0/255.0, blue: 15.0/255.0, alpha: 1.0).cgColor
		
		//Yellow Gradient
		let colorTopYellow =  UIColor(red: 158.0/255.0, green: 154.0/255.0, blue: 35.0/255.0, alpha: 0.15).cgColor
		let colorBottomYellow = UIColor(red: 158.0/255.0, green: 154.0/255.0, blue: 35.0/255.0, alpha: 1.0).cgColor
		
		//Green Gradient
		let colorTopGreen =  UIColor(red: 31.0/255.0, green: 158.0/255.0, blue: 30.0/255.0, alpha: 0.15).cgColor
		let colorBottomGreen = UIColor(red: 31.0/255.0, green: 158.0/255.0, blue: 30.0/255.0, alpha: 1.0).cgColor
		
		//Cyan Gradient
		let colorTopCyan =  UIColor(red: 45.0/255.0, green: 158.0/255.0, blue: 154.0/255.0, alpha: 0.15).cgColor
		let colorBottomCyan = UIColor(red: 45.0/255.0, green: 158.0/255.0, blue: 154.0/255.0, alpha: 1.0).cgColor
		
		//Gradient Color Arrays
		let colorTopArray: [CGColor] = [colorTopBlue, colorTopPurple, colorTopRed, colorTopOrange, colorTopYellow, colorTopGreen, colorTopCyan]
		let colorBottomArray: [CGColor] = [colorBottomBlue, colorBottomPurple, colorBottomRed, colorBottomOrange, colorBottomYellow, colorBottomGreen, colorBottomCyan]

		//Setup Cell View
		for i in 0...5
		{
			let myView : UIView? = cellViewCollection?[i]
			
			//Cell View Setup
			myView?.layer.cornerRadius = 8
			myView?.layer.masksToBounds = true
			myView?.layer.shadowOffset = CGSize(width: 0, height: 1)
			myView?.layer.shadowColor = UIColor.black.cgColor
			myView?.layer.shadowOpacity = 0.55
			myView?.layer.borderColor = UIColor.black.cgColor
			myView?.layer.borderWidth = 0.35
			
			//Setup Cell Gradient
			let gradientLayer = CAGradientLayer()
			
			gradientLayer.colors = [colorTopArray[i], colorBottomArray[i]]
			gradientLayer.locations = [0.0, 0.50]
			gradientLayer.frame = self.view.bounds
			
			myView?.layer.insertSublayer(gradientLayer, at:0)
		}
		
		//Setup Image View
		for i in 0...5
		{
			let myImageView : UIImageView? = imageViewCollection?[i]
			
			//Image View Setup
			myImageView?.layer.masksToBounds = true
			
			myImageView?.layer.borderWidth = 3.0
			myImageView?.layer.borderColor = UIColor.gray.cgColor
			myImageView?.layer.cornerRadius = (myImageView?.frame.width)! / 2
		}
		
		//Setup Title Label View
		for i in 0...5
		{
			let myLabelView : UILabel? = titleLabelCollection?[i]
			
			//Title Label Setup
			myLabelView?.layer.cornerRadius = 5
			myLabelView?.layer.masksToBounds = true
		}
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
