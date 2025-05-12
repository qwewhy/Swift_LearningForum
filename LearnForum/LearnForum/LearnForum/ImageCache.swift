import Foundation
import SwiftUI

class ImageCache {
    static let shared = ImageCache()
    
    private var cache = NSCache<NSString, UIImage>()
    
    private init() {
        cache.countLimit = 100
    }
    
    func set(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func get(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func remove(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
    }
    
    func removeAll() {
        cache.removeAllObjects()
    }
}

// 添加缓存支持
struct CachedAsyncImage<Content: View>: View {
    private let url: URL?
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Content
    
    init(
        url: URL?,
        scale: CGFloat = 1.0,
        transaction: Transaction = Transaction(),
        @ViewBuilder content: @escaping (AsyncImagePhase) -> Content
    ) {
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }
    
    var body: some View {
        if let url = url {
            if let cachedImage = ImageCache.shared.get(forKey: url.absoluteString) {
                content(.success(Image(uiImage: cachedImage)))
            } else {
                AsyncImage(
                    url: url,
                    scale: scale,
                    transaction: transaction
                ) { phase in
                    cacheAndRender(phase: phase)
                }
            }
        } else {
            content(.empty)
        }
    }
    
    private func cacheAndRender(phase: AsyncImagePhase) -> some View {
        if case .success(let image) = phase, let url = url {
            Task {
                if let uiImage = await imageToUIImage(image) {
                    ImageCache.shared.set(uiImage, forKey: url.absoluteString)
                }
            }
        }
        return content(phase)
    }
    
    private func imageToUIImage(_ image: Image) async -> UIImage? {
        let renderer = await ImageRenderer(content: image)
        return await renderer.uiImage
    }
} 