//
//  PartnerSetup.swift
//  SpadesSwiftOutline
//
//  Created by Michael Spade on 10/4/24.
//

import UIKit
import Foundation

class PartnerSetup : UIViewController
{
	// MARK: - Properties
    let prefs = UserDefaults.standard

	
	// MARK: - Methods
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
	}
	
	public func partnerSetup()-> (String?, UIImage?, String?, UIImage?, String?, UIImage?)
	{
		let gameScreen = GameScreen()
		print("Partner Setup")

		//Variables
		let partnerString = prefs.string(forKey: "partner")
		var randomPartnerArray = ["0", "1", "2", "3", "4", "5"]
		let partnerArray = ["partner1", "partner2", "partner3", "partner4", "partner5", "partner6"]
		let partnerNameArray = ["Mike", "Olga", "Abe", "Jamie", "Colin", "Tony"]
		let partnerImageArray = ["pic5", "pic2", "pic4", "pic3", "pic1", "pic6"]
		let randomOpponent1: Int
		let randomOpponent2: Int
		var partnerName: String?
		var partnerImage: UIImage?
		var opponentImage1: UIImage?
		var opponentImage2: UIImage?

		//Partner Setup
		
		if partnerString == nil
		{
			partnerName = "Tony"
			partnerImage = UIImage(named: "pic6")!
			//gameScreen.player2?.image = partnerImage
			randomPartnerArray.remove(at: 5)
		}
        else
        {
            for i in 0..<5
            {
                if partnerString == partnerArray[i]
                {
                    //gameScreen.playerNameLabel2?.text = partnerNameArray[i]
                    partnerName = partnerNameArray[i]
                    partnerImage = UIImage(named: partnerImageArray[i] as? String ?? "")!
                    //gameScreen.player2?.image = partnerImage
                    randomPartnerArray.remove(at: i)
                }
            }
        }
		randomOpponent1 = Int(arc4random_uniform(UInt32(randomPartnerArray.count)))
		var opponentName1 = partnerNameArray[randomOpponent1] as? String
		opponentImage1 = UIImage(named: partnerImageArray[randomOpponent1] as? String ?? "")!
		randomPartnerArray.remove(at: randomOpponent1)

		randomOpponent2 = Int(arc4random_uniform(UInt32(randomPartnerArray.count)))
		var opponentName2 = partnerNameArray[randomOpponent2] as? String
		opponentImage2 = UIImage(named: partnerImageArray[randomOpponent2] as? String ?? "")!
		
		print("partners \(opponentName1) \(opponentName2) ")
			
		return (partnerName, partnerImage, opponentName1, opponentImage1, opponentName2, opponentImage2)
	}

}
