//
//  TabBar.swift
//  AnimationRive
//
//  Created by Eslam Ghazy on 15/8/23.
//

import SwiftUI
import RiveRuntime

struct TabBar: View {
    
    @AppStorage("selectedTab") var selectedTab: Tabs = .chat
    
    let icon = RiveViewModel(fileName: "icons",stateMachineName: "CHAT_Interactivity" , artboardName: "CHAT")
    
    var body: some View {
        VStack {
            Spacer()
            HStack{
              content
            }
            .padding(13)
            .background(Color("Background 2").opacity(0.8))
            .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 24,style: .continuous))
        .shadow(color: Color("Background 2").opacity(0.3), radius: 20,x:0,y: 12)
        .overlay(RoundedRectangle(cornerRadius: 24,style: .continuous).stroke(.linearGradient(colors: [.white.opacity(0.5),.white.opacity(0.0)], startPoint: .topLeading, endPoint: .bottomTrailing)))
        .padding(.horizontal ,24)
        }
    }
    
    var content : some View {
        ForEach(tabItems) { item in
            Button {
                item.icon.setInput("active", value: true)
                // when click on button
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                    item.icon.setInput("active", value: false)
                        
                }
                withAnimation{
                    selectedTab = item.tab
                    print(selectedTab)
                }
            } label: {
                item.icon.view()
                    .frame(height :36)
                    .opacity(selectedTab == item.tab ? 1 : 0.5)
                    .background(
                        VStack{
                            RoundedRectangle(cornerRadius: 2)
                                .frame(width: selectedTab == item.tab ? 20 : 0, height: 4)
                                .offset(y: -4)
                                .opacity(selectedTab==item.tab ? 1 : 0)
                            Spacer()
                        }
                    )
           }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}


struct TabItem : Identifiable {
    
    var id: UUID
    var icon : RiveViewModel
    var tab: Tabs
    
}

var tabItems = [

    TabItem(id: UUID(), icon: RiveViewModel(fileName: "icons",stateMachineName: "CHAT_Interactivity" , artboardName: "CHAT") , tab: .chat),
    TabItem(id: UUID(), icon: RiveViewModel(fileName: "icons",stateMachineName: "SEARCH_Interactivity" , artboardName: "SEARCH"), tab: .search),
    TabItem(id: UUID(), icon: RiveViewModel(fileName: "icons",stateMachineName: "TIMER_Interactivity" , artboardName: "TIMER"), tab: .timer),
    TabItem(id: UUID(), icon: RiveViewModel(fileName: "icons",stateMachineName: "BELL_Interactivity" , artboardName: "BELL") , tab: .bell),
    TabItem(id: UUID(), icon: RiveViewModel(fileName: "icons",stateMachineName: "USER_Interactivity" , artboardName: "USER") , tab: .user)

]

enum Tabs : String {
    
    case chat
    case search
    case timer
    case bell
    case user
    
}















