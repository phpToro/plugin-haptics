import UIKit

final class HapticsHandler: NativeHandler {
    let namespace = "haptics"

    private let notification = UINotificationFeedbackGenerator()
    private let selection = UISelectionFeedbackGenerator()

    func handle(method: String, args: [String: Any]) -> Any? {
        switch method {
        case "impact":
            let style = args["style"] as? String ?? "medium"
            let generator: UIImpactFeedbackGenerator
            switch style {
            case "light": generator = UIImpactFeedbackGenerator(style: .light)
            case "heavy": generator = UIImpactFeedbackGenerator(style: .heavy)
            case "rigid": generator = UIImpactFeedbackGenerator(style: .rigid)
            case "soft": generator = UIImpactFeedbackGenerator(style: .soft)
            default: generator = UIImpactFeedbackGenerator(style: .medium)
            }
            generator.impactOccurred()
            return true

        case "notification":
            let type = args["type"] as? String ?? "success"
            switch type {
            case "error": notification.notificationOccurred(.error)
            case "warning": notification.notificationOccurred(.warning)
            default: notification.notificationOccurred(.success)
            }
            return true

        case "selection":
            selection.selectionChanged()
            return true

        default:
            return ["error": "Unknown method: \(method)"]
        }
    }
}
