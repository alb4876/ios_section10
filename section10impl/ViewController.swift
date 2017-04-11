import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var countdownLabel : UILabel!
    @IBOutlet var rocket : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nc = NotificationCenter.default
        
        nc.addObserver(forName: AppDelegate.TickerNotificationName,
                       object: nil,
                       queue: nil) { notification in
                        let userInfo = notification.userInfo!
                        let timerCount = userInfo["ticks"] as! Int
                        let msg = timerCount < 10 ? "T - " + String(10 - timerCount) : "Blast Off!"
                        self.countdownLabel.text = msg
                        if timerCount == 10 {
                            self.blastOff()
                        }
                        
        }
    }
    
    func blastOff() {
        let originalOrigin = self.rocket.frame.origin
        UIView.animate(
            withDuration: 3,
            delay: 0,
            options: .curveEaseIn,
            animations: {
                self.rocket.frame.origin = CGPoint(x: 0, y: 0 - self.rocket.bounds.height)
            },
            completion: { _ in 
                self.rocket.frame.origin = originalOrigin
            }
        )
    }
}

