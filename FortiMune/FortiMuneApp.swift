import SwiftUI
import WebKit

private let fortiMuneURL = URL(string: "https://ebrahimemary3-beep.github.io/FortiMune-Injection-Management/?app=ios")!

struct FortiMuneWebView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator { Coordinator() }

    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.websiteDataStore = .default()
        configuration.allowsInlineMediaPlayback = true
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.navigationDelegate = context.coordinator
        webView.uiDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.load(URLRequest(url: fortiMuneURL, cachePolicy: .useProtocolCachePolicy))
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {}

    final class Coordinator: NSObject, WKNavigationDelegate, WKUIDelegate {
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction,
                     decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            guard let url = navigationAction.request.url else {
                decisionHandler(.cancel); return
            }
            let host = url.host ?? ""
            if host.hasSuffix("github.io") || host.hasSuffix("supabase.co") || host.hasSuffix("jsdelivr.net") {
                decisionHandler(.allow)
            } else {
                UIApplication.shared.open(url)
                decisionHandler(.cancel)
            }
        }
    }
}

@main
struct FortiMuneApp: App {
    var body: some Scene {
        WindowGroup {
            FortiMuneWebView()
                .ignoresSafeArea(.container, edges: [.top, .bottom])
        }
    }
}
