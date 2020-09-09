
class FindOutMoreCell: UITableViewCell {

    private lazy var findOutMoreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Appearance.buttonTitle, for: .normal)
        button.contentHorizontalAlignment = .leading
        button.setTitleColor(.primary, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    private var findOutMoreUrl: URL?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(findOutMoreButton)

        NSLayoutConstraint.activate([
            contentView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: findOutMoreButton.leadingAnchor),
            contentView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: findOutMoreButton.topAnchor, constant: Appearance.topMargin),
            contentView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: findOutMoreButton.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with url: URL?) {
        self.findOutMoreUrl = url
    }
}

// Appearance
private extension FindOutMoreCell {
    enum Appearance {
        static let buttonTitle = NSLocalizedString("Find out more", comment: "Title for the find out more button in the What's New page.")
        static let buttonFont = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .callout), size: 16)
        static let topMargin: CGFloat = -8
    }

    @objc func buttonTapped() {
        guard let url = self.findOutMoreUrl else {
            return
        }
        // TODO - WHATSNEW: we should probably present the post in a WebView
        UIApplication.shared.open(url)
    }
}
