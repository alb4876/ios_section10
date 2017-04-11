import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var timer : Timer!
    
    public static let TickerNotificationName = Notification.Name(rawValue: "TimerTicked")
    
    func applicationWillResignActive(_ application: UIApplication) {
        timer.invalidate()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        let nc = NotificationCenter.default
        
        var n = 0
        let myBlock : (Timer) -> Void = { timer in
            n += 1
            let userInfo = ["ticks": n]
            let notification = Notification(
                name: AppDelegate.TickerNotificationName,
                object: nil,
                userInfo: userInfo)
            nc.post(notification)
        }

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: myBlock)
    }
}

