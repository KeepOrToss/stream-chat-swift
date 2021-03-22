import UIKit
import StreamChat
import StreamChatUI

extension ChatClient {
    /// The singleton instance of `ChatClient`
    static let shared: ChatClient = {
        // Register custom UI elements
        var uiConfig = UIConfig()
        
        uiConfig.channelList.itemView = ChatChannelListItemView.SwiftUIWrapper<MessengerChatChannelListItem>.self
        uiConfig.images.newChat = UIImage(systemName: "square.and.pencil")!
        
        UIConfig.default = uiConfig
        
        let config = ChatClientConfig(apiKey: APIKey("q95x9hkbyd6p"))
        return ChatClient(
            config: config,
            tokenProvider: .static("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiY2lsdmlhIn0.jHi2vjKoF02P9lOog0kDVhsIrGFjuWJqZelX5capR30")
        )
    }()
}

