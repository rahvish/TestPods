//
//  UIViewExtension.swift
//  Infotek-iOS
//
//  Created by Rajesh Nekkanti on 11/02/20.
//  Copyright © 2020 Rajesh Nekkanti. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class DesignableView: UIView {
    
    @IBInspectable var firstColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var secondColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }

    @IBInspectable var isHorizontal: Bool = true {
        didSet {
            updateView()
        }
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor, secondColor].map {$0.cgColor}
        if (isHorizontal) {
            layer.startPoint = CGPoint(x: 0, y: 0.5)
            layer.endPoint = CGPoint (x: 1, y: 0.5)
        } else {
            layer.startPoint = CGPoint(x: 0.5, y: 0)
            layer.endPoint = CGPoint (x: 0.5, y: 1)
        }
    }
}

@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
class DesignableLabel: UILabel {
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
}


final class LinearGradientLayer: CALayer {

    enum Direction {
        case vertical
        case horizontal
        case custom(start: CGPoint, end: CGPoint)

        var points: (start: CGPoint, end: CGPoint) {
            switch self {
            case .vertical:
                return (CGPoint(x: 0.5, y: 0.0), CGPoint(x: 0.5, y: 1.0))
            case .horizontal:
                return (CGPoint(x: 0.0, y: 0.5), CGPoint(x: 1.0, y: 0.5))
            case let .custom(start, end):
                return (start, end)
            }
        }
    }

    var direction: Direction = .vertical

    var colorSpace: CGColorSpace = CGColorSpaceCreateDeviceRGB()
    var colors: [CGColor]?
    var locations: [CGFloat]?

    var options: CGGradientDrawingOptions = CGGradientDrawingOptions(rawValue: 0)

    // MARK: - Lifecycle

    required override init() {
        super.init()
        masksToBounds = true
        needsDisplayOnBoundsChange = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    required override init(layer: Any) {
        super.init(layer: layer)
    }

    override func draw(in ctx: CGContext) {
        ctx.saveGState()

        guard let colors = colors, let gradient = CGGradient(colorsSpace: colorSpace,
                                                             colors: colors as CFArray, locations: locations) else { return }


        let points = direction.points
        ctx.drawLinearGradient(
            gradient,
            start: transform(points.start),
            end: transform(points.end),
            options: options
        )
    }

    // MARK: - Private

    private func transform(_ point: CGPoint) -> CGPoint {
        return CGPoint(x: bounds.width * point.x, y: bounds.height * point.y)
    }
}

final class GradientView: UIView {

    lazy var gradientLayer = layer as? LinearGradientLayer

    override class var layerClass: AnyClass {
        return LinearGradientLayer.self
    }

    func updateGradient(with direction: LinearGradientLayer.Direction, colors: UIColor...) {
        gradientLayer?.direction = direction
        gradientLayer?.colors = colors.map { color in
            color.cgColor
        }
    }
}

