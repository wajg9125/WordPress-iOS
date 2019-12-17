/// Contains methods to format post reblog content for either Gutenberg or Classic Editor
struct ReblogFormatter {

    static func gutenbergQuote(text: String, citation: String? = nil) -> String {
        return embedInWpQuote(html: quoteWithCitation(text: text, citation: citation))
    }

    static func gutenbergImage(image: String) -> String {
        return embedInWpParagraph(html: htmlImage(image: image))
    }


    static func classicEditorQuote(text: String, citation: String? = nil) -> String {
        return embedInQuote(html: quoteWithCitation(text: text, citation: citation))
    }

    static func classicEditorImage(image: String) -> String {
        return embedInParagraph(html: htmlImage(image: image))
    }
}


// MARK: - Gutenberg formatter helpers
extension ReblogFormatter {

    private static func embedInWpParagraph(html: String) -> String {
        return "<!-- wp:paragraph -->\n<p>\(html)</p>\n<!-- /wp:paragraph -->"
    }

    private static func embedInWpQuote(html: String) -> String {
        return "<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\">\(html)</blockquote>\n<!-- /wp:quote -->"
    }
}

// MARK: - Standard HTML formatter helpers
extension ReblogFormatter {

    static func hyperLink(url: String, text: String) -> String {
        return "<a href=\"\(url)\">\(text)</a>"
    }

    private static func htmlImage(image: String) -> String {
        return "<img src=\"\(image)\">"
    }

    private static func embedInQuote(html: String) -> String {
        return "<blockquote>\(html)</blockquote>"
    }

    private static func embedInParagraph(html: String) -> String {
        return "<p>\(html)</p>"
    }

    private static func embedinCitation(html: String) -> String {
        return "<cite>\(html)</cite>"
    }

    private static func quoteWithCitation(text: String, citation: String? = nil) -> String {
        var formattedText = embedInParagraph(html: text)
        if let citation = citation {
            formattedText.append(embedinCitation(html: citation))
        }
        return formattedText
    }
}
