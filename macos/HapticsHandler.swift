import AppKit

/// Haptics no-op handler for macOS — Macs don't have haptic engines.
/// Silently succeeds so PHP code doesn't need platform checks.
final class HapticsHandler: NativeHandler {
    let namespace = "haptics"

    func handle(method: String, args: [String: Any]) -> Any? {
        // All haptic methods are no-ops on macOS
        return true
    }
}
