//
//  ViewController.swift
//  ColorChange
//
//  Created by Wei Pan on 2022/5/8.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var gradientSlider: UISlider!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var gradientSwitch: UISwitch!
    @IBOutlet weak var gradientView: UIImageView!
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var emitterSwitch: UISwitch!
    
    let snowEmitterLayer = CAEmitterLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        snowEmitter()
        
    }
    
    @IBAction func colorRandom(_ sender: Any) {
        redSlider.value = Float.random(in: 0...1)
        greenSlider.value = Float.random(in: 0...1)
        blueSlider.value = Float.random(in: 0...1)
        alphaSlider.value = Float.random(in: 0...1)
        imageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        alphaLabel.text = String(format: "%.2f", alphaSlider.value)
    }
    
    @IBAction func changeColor(_ sender: Any) {
        imageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        alphaLabel.text = String(format: "%.2f", alphaSlider.value)
    }
    
    @IBAction func changeGragientColor(_ sender: Any) {
        if gradientSwitch.isOn{
            redSlider.isEnabled = false
            greenSlider.isEnabled = false
            blueSlider.isEnabled = false
            alphaSlider.isEnabled = false
            randomButton.isEnabled = false
            gradientSlider.isEnabled = true
            imageView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            redSlider.value = 0
            greenSlider.value = 0
            blueSlider.value = 0
            alphaSlider.value = 0
        } else {
            gradientSlider.isEnabled = false
            redSlider.isEnabled = true
            greenSlider.isEnabled = true
            blueSlider.isEnabled = true
            alphaSlider.isEnabled = true
            randomButton.isEnabled = true
        }
    }
    
    
    @IBAction func changeGradientColor(_ sender: Any) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
        CGColor(red: 1, green: 182/255, blue: 193/255, alpha: 1),
        CGColor(red: 230/255, green: 230/255, blue: 250/255, alpha: 1)
        ]
        gradientLayer.frame = gradientView.bounds
        gradientLayer.locations = [0.0,NSNumber(value:gradientSlider
                                                    .value)]
        gradientView.layer.addSublayer(gradientLayer)
    }
    
    
    func snowEmitter(){
        let snowEmitterCell = CAEmitterCell()
        snowEmitterCell.contents = UIImage(named: "snow")?.cgImage
        snowEmitterCell.birthRate = 10
        snowEmitterCell.lifetime = 20
        snowEmitterCell.velocity = 10
        snowEmitterCell.velocityRange = 10
        snowEmitterCell.yAcceleration = 10
        snowEmitterCell.scale = 1
        snowEmitterCell.scaleRange = 1
        snowEmitterCell.scaleSpeed = -0.02
        snowEmitterCell.spin = 0.5
        snowEmitterCell.spinRange = 0.5
        snowEmitterCell.emissionRange = .pi*0.5
        snowEmitterLayer.emitterCells = [snowEmitterCell]
        snowEmitterLayer.position = CGPoint(x: view.bounds.width/2, y: -100)
        snowEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        snowEmitterLayer.emitterShape = .line
        view.layer.addSublayer(snowEmitterLayer)
    }
    
    @IBAction func changeEmitterStatus(_ sender: Any) {
        if emitterSwitch.isOn{
            snowEmitter()
            switchLabel.text = "開啟下雪"
        } else {
            snowEmitterLayer.removeFromSuperlayer()
            switchLabel.text = "關閉下雪"
        }
    }
    
}

