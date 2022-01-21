//
//  Utils.swift
//  PujolApp
//
//  Created by Teki on 20/01/22.
//

import Foundation
import UIKit

public var width = UIScreen.main.bounds.width
public var height = UIScreen.main.bounds.height

public enum Anchor { case left, top, right, bottom }

public extension UIView {

    static func topPadding() -> CGFloat {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0.0
        } else {
            return 0.0
        }
    }

    static func bottomPadding() -> CGFloat {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0.0
        } else {
            return 0.0
        }
    }


    func addAnchorsWithMargin(_ margin: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leftAnchor.constraint(equalTo: self.superview!.leftAnchor, constant: margin).isActive = true
        self.topAnchor.constraint(equalTo: self.superview!.topAnchor, constant: margin).isActive = true
        self.rightAnchor.constraint(equalTo: self.superview!.rightAnchor, constant: -margin).isActive = true
        self.bottomAnchor.constraint(equalTo: self.superview!.bottomAnchor, constant: -margin).isActive = true
    }

    /**
     Description: Centers the view in the superview, using the superview's **size** and **XYAxis** position, not the left, top, right, bottom anchors to avoid issues with the *UISCrollViews*
     Parameters: None
     */
    func addAnchorsCenterAndFillContainerWithSize() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalTo: self.superview!.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: self.superview!.heightAnchor).isActive = true
        self.centerXAnchor.constraint(equalTo: self.superview!.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: self.superview!.centerYAnchor).isActive = true
    }


    func addAnchorsAndCenter(centerX: Bool?, centerY: Bool?, width: CGFloat?, height: CGFloat?, left: CGFloat?, top: CGFloat?, right: CGFloat?, bottom: CGFloat?, withAnchor: Anchor? = nil, relativeToView: UIView? = nil) {

        self.translatesAutoresizingMaskIntoConstraints = false
        if centerX != nil {
            if centerX! == true {
                self.centerXAnchor.constraint(equalTo: self.superview!.centerXAnchor).isActive = true
            }
        }
        if centerY != nil {
            if centerY! == true {
                self.centerYAnchor.constraint(equalTo: self.superview!.centerYAnchor).isActive = true
            }
        }

        self.addAnchorsAndSize(width: width, height: height, left: left, top: top, right: right, bottom: bottom, withAnchor: withAnchor, relativeToView: relativeToView)
    }

    func addAnchorsAndSize(width: CGFloat?, height: CGFloat?, left: CGFloat?, top: CGFloat?, right: CGFloat?, bottom: CGFloat?, withAnchor: Anchor? = nil, relativeToView: UIView? = nil) {

        self.translatesAutoresizingMaskIntoConstraints = false
        if width != nil {
            self.widthAnchor.constraint(equalToConstant: width!).isActive = true
        }
        if height != nil {
            self.heightAnchor.constraint(equalToConstant: height!).isActive = true
        }
        self.addAnchors(left: left, top: top, right: right, bottom: bottom, withAnchor: withAnchor, relativeToView: relativeToView)
    }


    func addAnchors(left: CGFloat?, top: CGFloat?, right: CGFloat?, bottom: CGFloat?, withAnchor: Anchor? = nil, relativeToView: UIView? = nil) {

        self.translatesAutoresizingMaskIntoConstraints = false
        let superView = self.superview!
        if withAnchor != nil && relativeToView != nil {
            /**
             * Anchors relative to oposite anchors of reference view
             **/
            switch withAnchor! {
            case .left:
                if left != nil {
                    self.leftAnchor.constraint(equalTo: relativeToView!.rightAnchor, constant: left!).isActive = true
                }
            case .top:
                if top != nil {
                    self.topAnchor.constraint(equalTo: relativeToView!.bottomAnchor, constant: top!).isActive = true
                }
            case .right:
                if right != nil {
                    self.rightAnchor.constraint(equalTo: relativeToView!.leftAnchor, constant: -right!).isActive = true
                }
            case .bottom:
                if bottom != nil {
                    self.bottomAnchor.constraint(equalTo: relativeToView!.topAnchor, constant: -bottom!).isActive = true
                }
            }
        }

        /**
         * Anchors relative to same anchors of superview
         **/
        if let _anchor = withAnchor {
            if _anchor == .left {
                if top != nil {
                    self.topAnchor.constraint(equalTo: superView.topAnchor, constant: top!).isActive = true
                }
                if right != nil {
                    self.rightAnchor.constraint(equalTo: superView.rightAnchor, constant: -right!).isActive = true
                }
                if bottom != nil {
                    self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -bottom!).isActive = true
                }
            }
            if _anchor == .top {
                if left != nil {
                    self.leftAnchor.constraint(equalTo: superView.leftAnchor, constant: left!).isActive = true
                }
                if right != nil {
                    self.rightAnchor.constraint(equalTo: superView.rightAnchor, constant: -right!).isActive = true
                }
                if bottom != nil {
                    self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -bottom!).isActive = true
                }
            }
            if _anchor == .right {
                if left != nil {
                    self.leftAnchor.constraint(equalTo: superView.leftAnchor, constant: left!).isActive = true
                }
                if top != nil {
                    self.topAnchor.constraint(equalTo: superView.topAnchor, constant: top!).isActive = true
                }
                if bottom != nil {
                    self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -bottom!).isActive = true
                }
            }
            if _anchor == .bottom {
                if left != nil {
                    self.leftAnchor.constraint(equalTo: superView.leftAnchor, constant: (left!)).isActive = true
                }
                if top != nil {
                    self.topAnchor.constraint(equalTo: superView.topAnchor, constant: top!).isActive = true
                }
                if right != nil {
                    self.rightAnchor.constraint(equalTo: superView.rightAnchor, constant: -right!).isActive = true
                }
            }
        } else {
            if left != nil {
                self.leftAnchor.constraint(equalTo: superView.leftAnchor, constant: left!).isActive = true
            }
            if top != nil {
                self.topAnchor.constraint(equalTo: superView.topAnchor, constant: top!).isActive = true
            }
            if right != nil {
                self.rightAnchor.constraint(equalTo: superView.rightAnchor, constant: -right!).isActive = true
            }
            if bottom != nil {
                self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -bottom!).isActive = true
            }
        }
    }
}
