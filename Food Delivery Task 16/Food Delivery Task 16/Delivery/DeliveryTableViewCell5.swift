//
//  DeliveryTableViewCell5.swift
//  Food Delivery Task 16
//
//  Created by Naved Khan on 14/04/23.
//

import UIKit

class DeliveryTableViewCell5: UITableViewCell {

    @IBOutlet var dashedView: UIView!
    @IBOutlet var dashedView2: UIView!

    func drawDottedLine(start p0: CGPoint, end p1: CGPoint, view: UIView) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [10, 6] // 10 is the length of dash, 6 is length of the gap.

        let path = CGMutablePath()
        path.addLines(between: [p0, p1])
        print(p0,p1)
        shapeLayer.path = path
        view.layer.addSublayer(shapeLayer)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        drawDottedLine(start: CGPoint(x: dashedView.bounds.minX, y: dashedView.bounds.maxY), end: CGPoint(x: dashedView.bounds.minX, y: dashedView.bounds.minY), view: dashedView)
        drawDottedLine(start: CGPoint(x: dashedView.bounds.minX, y: dashedView.bounds.minY), end: CGPoint(x: dashedView.bounds.minX, y: dashedView.bounds.maxY), view: dashedView2)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
