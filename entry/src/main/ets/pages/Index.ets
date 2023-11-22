import { DiscoverPage } from './discover/DiscoverPage'
import { HomePage } from './home/HomePage'
import { ProfilePage } from './profile/ProfilePage'
import { RecommendPage } from './recommand/RecommandPage'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State currentIndex: number = 0
  private tabsController: TabsController = new TabsController()

  @Builder TabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
        .fontSize(14)
        .margin({ top: 5 })
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
      TabContent() {
        HomePage()
      }
      .tabBar(this.TabBuilder('首页', 0, $r('app.media.mine_selected'), $r('app.media.mine_normal')))

      TabContent() {
        RecommendPage()
      }
      .tabBar(this.TabBuilder('推荐', 1, $r('app.media.mine_selected'), $r('app.media.mine_normal')))

      TabContent() {
        DiscoverPage()
      }
      .tabBar(this.TabBuilder('发现', 2, $r('app.media.mine_selected'), $r('app.media.mine_normal')))

      TabContent() {
        ProfilePage()
      }
      .tabBar(this.TabBuilder('我的', 3, $r('app.media.mine_selected'), $r('app.media.mine_normal')))
    }.scrollable(false)

  }
}
