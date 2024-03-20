//
//  YouTubeHome.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/20/24.
//

import SwiftUI

struct YouTubeHome: View {
    @State private var activeTab: YouTubeTab = .home
    @State private var config: PlayerConfig = .init()
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $activeTab) {
                HomeTabView()
                    .setupTab(.home)
                
                Text(YouTubeTab.shorts.rawValue)
                    .setupTab(.shorts)
                
                Text(YouTubeTab.subscriptions.rawValue)
                    .setupTab(.subscriptions)
                
                Text(YouTubeTab.you.rawValue)
                    .setupTab(.you)
            }
            .padding(.bottom, tabBarHeight)
            
            CustomTabBar()
            
            GeometryReader {
                let size = $0.size
                if config.showMioniPlayer {
                    MiniPlayerView(size: size, config: $config)
                }
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    @ViewBuilder
    func HomeTabView() -> some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVStack(spacing: 15) {
                    ForEach(playerItems) { item in
                        PlayerItemCardView(item) {
                            config.selectedPlayerItem = item
                            withAnimation(.easeIn(duration: 0.3)) {
                                config.showMioniPlayer = true
                            }
                        }
                    }
                }
                .padding(15)
            }
            .navigationTitle("Youtube")
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.background, for: .navigationBar)
        }
    }
    
    @ViewBuilder
    func PlayerItemCardView(_ item: PlayerItem, onTap: @escaping () -> ()) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Image(systemName: item.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 180)
                .clipShape(.rect(cornerRadius: 10))
                .contentShape(.rect)
                .onTapGesture(perform: onTap)
                .background(.gray)
            
            HStack(spacing: 10) {
                Image(systemName: "person.circle.fill")
                    .font(.title)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title)
                        .font(.callout)
                    
                    HStack(spacing: 6) {
                        Text(item.author)
                        Text("' 2 Days Ago")
                    }
                    .font(.caption)
                    .foregroundStyle(.gray)
                }
            }
        }
    }
    
    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(YouTubeTab.allCases, id: \.rawValue) {tab in
                VStack(spacing: 4) {
                    Image(systemName: tab.symbol)
                        .font(.title3)
                    Text(tab.rawValue)
                        .font(.caption2)
                }
                .foregroundStyle(activeTab == tab ? Color.primary : .gray)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(.rect)
                .onTapGesture {
                    activeTab = tab
                }
            }
        }
        .frame(height: 49)
        .overlay(alignment: .top) {
            Divider()
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .frame(height: tabBarHeight)
        .background(.background)
    }
}

extension View {
    @ViewBuilder
    func setupTab(_ tab: YouTubeTab) -> some View {
        self
            .tag(tab)
            .toolbar(.hidden, for: .tabBar)
    }
    
    var safeArea: UIEdgeInsets {
        if let safeArea = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.keyWindow?.safeAreaInsets {
            return safeArea
        }
        return .zero
    }
    
    var tabBarHeight: CGFloat {
        return 49 + safeArea.bottom
    }
}

#Preview {
    YouTubeHome()
}
