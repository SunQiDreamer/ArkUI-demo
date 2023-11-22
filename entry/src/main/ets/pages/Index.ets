import router from '@ohos.router'

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
        // HomePage()
        Text('首页的内容').fontSize(30)
      }
      .tabBar(this.TabBuilder('首页', 0, $r('app.media.mine_selected'), $r('app.media.mine_normal')))

      TabContent() {
        Text('推荐的内容').fontSize(30)
      }
      .tabBar(this.TabBuilder('推荐', 1, $r('app.media.mine_selected'), $r('app.media.mine_normal')))

      TabContent() {
        Text('发现的内容').fontSize(30)
      }
      .tabBar(this.TabBuilder('发现', 2, $r('app.media.mine_selected'), $r('app.media.mine_normal')))

      TabContent() {
        Text('我的内容').fontSize(30)
      }
      .tabBar(this.TabBuilder('我的', 3, $r('app.media.mine_selected'), $r('app.media.mine_normal')))
    }.scrollable(false)

  }
}
