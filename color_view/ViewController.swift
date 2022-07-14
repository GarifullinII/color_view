//
//  ViewController.swift
//  color_view
//
//  Created by Ildar Garifullin on 13/07/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var viewColor: UIView!
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // MARK: View Color
        viewColor.layer.cornerRadius = 16
        viewColor.backgroundColor = .systemIndigo
        // MARK: Label
        // MARK: Slider
        redSlider.value = 0.2
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.minimumTrackTintColor = .red
        redSlider.maximumTrackTintColor = .black
        redSlider.thumbTintColor = .blue
        // -------
        greenSlider.value = 0.4
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.minimumTrackTintColor = .green
        greenSlider.maximumTrackTintColor = .black
        greenSlider.thumbTintColor = .blue
        // -------
        blueSlider.value = 0.6
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.minimumTrackTintColor = .systemBlue
        blueSlider.maximumTrackTintColor = .black
        blueSlider.thumbTintColor = .blue
        
        setColorView()
        setValue(for: redLabel, greenLabel, blueLabel)
    }
    
    // изменение цветов слайдерами
    @IBAction func slidersAction(_ sender: UISlider) {
        setColorView()
        
        switch sender.tag {
        case 0: redLabel.text = String(Float(round(redSlider.value * 10)/10))
        case 1: greenLabel.text = String(Float(round(greenSlider.value * 10)/10))
        case 2: blueLabel.text = String(Float(round(blueSlider.value * 10)/10))
        default: break
        }
    }
    
    // изменение цвета View
    private func setColorView() {
        viewColor.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redLabel.text = String(redSlider.value)
            case 1: greenLabel.text = String(greenSlider.value)
            case 2: blueLabel.text = String(blueSlider.value)
            default: break
            }
        }
    }
}

