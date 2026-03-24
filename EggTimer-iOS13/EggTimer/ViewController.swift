

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var eggAppLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var seccondPassed = 0
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        // print(sender.currentTitle!)
        
        timer.invalidate()
        let hardness = sender.currentTitle!// Soft, Medium, Hard
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        seccondPassed = 0
        eggAppLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    
    //    print(eggTimes[hardness]!)
        
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
    @objc func updateCounter() {
        //example functionality
        
        if seccondPassed < totalTime {
            seccondPassed += 1
            progressBar.progress = (Float(seccondPassed) / Float(totalTime))
            print(Float(seccondPassed) / Float(totalTime))
            
        }else{
            timer.invalidate()
            eggAppLabel.text = "DONE!!"
            playSound(soundName: "alarm_sound")
        
        }
        
    }
}
