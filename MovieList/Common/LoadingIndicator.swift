

import Foundation
import UIKit

class LoadingIndicator: UIView {

    private static let sharedInstance = LoadingIndicator()

    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        backgroundColor = UIColor(white: 0, alpha: 0.4)
        addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    static func startAnimating() {
        guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
        sharedInstance.frame = window.bounds
        window.addSubview(sharedInstance)
        sharedInstance.activityIndicator.startAnimating()
    }

    static func stopAnimating() {
        sharedInstance.removeFromSuperview()
        sharedInstance.activityIndicator.stopAnimating()
    }
}
