import Foundation
import UIKit

class TinderCardFooterView: UIView {

  private var label = UILabel()

  private var gradientLayer: CAGradientLayer?

  init(withTitle title: String?, subtitle: String?) {
    super.init(frame: CGRect.zero)
    backgroundColor = .clear
    layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    layer.cornerRadius = 10
    clipsToBounds = true
    isOpaque = false
    initialize(title: title, subtitle: subtitle)
  }

  required init?(coder aDecoder: NSCoder) {
    return nil
  }

  private func initialize(title: String?, subtitle: String?) {
    var a = "" // 제품간단설명
    var b = "" // 가격
    var c = "" // 좋아요 갯수
    let attributedText = NSMutableAttributedString(string: (title ?? "") + "\n", attributes: NSAttributedString.Key.titleAttributes)
    if let subtitle = subtitle, !subtitle.isEmpty {
      attributedText.append(NSMutableAttributedString(string: subtitle,
                                                      attributes: NSAttributedString.Key.subtitleAttributes))
      let paragraphStyle = NSMutableParagraphStyle()
      paragraphStyle.lineSpacing = 4
      paragraphStyle.lineBreakMode = .byTruncatingTail
      attributedText.addAttributes([NSAttributedString.Key.paragraphStyle: paragraphStyle],
                                   range: NSRange(location: 0, length: attributedText.length))
      label.numberOfLines = 2
    }

    label.attributedText = attributedText
    addSubview(label)
  }

  override func layoutSubviews() {
    let padding: CGFloat = 20
    label.frame = CGRect(x: padding,
                         y: bounds.height - label.intrinsicContentSize.height - padding,
                         width: bounds.width - 2 * padding,
                         height: label.intrinsicContentSize.height)
  }
}

extension NSAttributedString.Key {

  static var shadowAttribute: NSShadow = {
    let shadow = NSShadow()
    shadow.shadowOffset = CGSize(width: 0, height: 1)
    shadow.shadowBlurRadius = 2
    shadow.shadowColor = UIColor.black.withAlphaComponent(0.3)
    return shadow
  }()

  static var titleAttributes: [NSAttributedString.Key: Any] = [
    // swiftlint:disable:next force_unwrapping
    NSAttributedString.Key.font: UIFont(name: "ArialRoundedMTBold", size: 24)!,
    NSAttributedString.Key.foregroundColor: UIColor.white,
    NSAttributedString.Key.shadow: NSAttributedString.Key.shadowAttribute
  ]

  static var subtitleAttributes: [NSAttributedString.Key: Any] = [
    // swiftlint:disable:next force_unwrapping
    NSAttributedString.Key.font: UIFont(name: "Arial", size: 17)!,
    NSAttributedString.Key.foregroundColor: UIColor.white,
    NSAttributedString.Key.shadow: NSAttributedString.Key.shadowAttribute
  ]
}
