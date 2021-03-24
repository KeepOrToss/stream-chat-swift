//
// Copyright © 2021 Stream.io Inc. All rights reserved.
//

import StreamChat
import StreamChatUI
import SwiftUI
import XCTest

@available(iOS 13.0, *)
final class SwiftUIViewRepresentable_Tests: XCTestCase {
    func test_wrappedChatChannelAvatarView() {
        struct CustomView: View {
            @EnvironmentObject var uiConfig: UIConfig.ObservableObject
            let content: (channel: _ChatChannel<NoExtraData>?, currentUserId: UserId?)
            
            var body: some View {
                uiConfig.channelList.itemSubviews.avatarView.asView(content)
                    .frame(width: 50, height: 50)
            }
        }
        
        final class CustomAvatarView: ChatChannelAvatarView {
            override func setUpAppearance() {
                super.setUpAppearance()
                
                presenceAvatarView.avatarView.imageView.backgroundColor = .red
            }
        }
        
        let channel = ChatChannel.mock(cid: .unique)
        
        var config = UIConfig()
        config.channelList.itemSubviews.avatarView = CustomAvatarView.self
        let view = CustomView(content: (channel, .unique))
            .environmentObject(config.asObservableObject)
        
        AssertSnapshot(view)
    }
}
