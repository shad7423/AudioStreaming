//
//  ViewController.swift
//  Audio Streaming
//
//  Created by Shadab Khan on 5/9/18.
//  Copyright © 2018 Shadab Khan. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class ViewController: UIViewController ,AVAudioPlayerDelegate{
    
    
    let url = "http://ec2-18-219-135-78.us-east-2.compute.amazonaws.com/audio_files/1521739954.mp3"
    var player :AVPlayer = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            print("AVAudioSession Category Playback OK")
            do {
                try AVAudioSession.sharedInstance().setActive(true)
                print("AVAudioSession is Active")
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }

   

    @IBAction func audioPlay(_ sender: UIButton) {
        playAudioFile()
        print("play button call")
    }
    
    @IBAction func audioStop(_ sender: UIButton) {
        stopAudioFile()
        print("stop button call")
    }
    
    
    
    
   //-  functions
    func playAudioFile() {
        print("play func call")
                do {
            player = AVPlayer(url: URL(string: url)!)
            player.volume = 1.0
            player.rate = 1.0
            player.play()
            
            print("play success")
            
        } catch let error {
            print(error.localizedDescription)
            print("Failed audio play")
        }
        
    }
  
    func stopAudioFile() {
        player.pause()
    }
    
}

