import AppKit

@MainActor
public class JWWContextMenuConfiguration: NSObject {
    public var identifier: NSUserInterfaceItemIdentifier
    public var items: [NSMenuItem]

    public init(identifier: NSUserInterfaceItemIdentifier, items: [NSMenuItem]) {
        self.identifier = identifier
        self.items = items
        super.init()
    }
}

public protocol JWWCollectionViewDelegate: NSCollectionViewDelegate {
    func collectionView(_ collectionView: NSCollectionView,
                        contextMenuConfigurationForItemAt indexPath: IndexPath,
                        point: CGPoint) -> JWWContextMenuConfiguration?
}

/// Customized NSCollectionView with built-in support for displaying a right-click menu.
open class JWWCollectionView: NSCollectionView {
    // MARK: Menu Handling
    // ====================================
    // Menu Handling
    // ====================================

    open override func menu(for event: NSEvent) -> NSMenu? {
        guard let delegate = delegate as? JWWCollectionViewDelegate else {
            return super.menu(for: event)
        }
        let point = convert(event.locationInWindow, from: nil)

        guard let indexPath = indexPathForItem(at: point) else {
            return super.menu(for: event)
        }

        guard let menuConfiguration = delegate.collectionView(self, contextMenuConfigurationForItemAt: indexPath, point: point) else {
            return super.menu(for: event)
        }

        let menu = NSMenu()
        defer { self.menu = menu }
        for item in menuConfiguration.items {
            menu.addItem(item)
        }

        return menu
    }
}
