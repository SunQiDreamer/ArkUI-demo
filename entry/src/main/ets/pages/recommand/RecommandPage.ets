@Component
export struct RecommendPage {
  @State dataSource: any[] = [{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}]
  @State isRefreshing: boolean = false
  @State counter: number = 0

  build() {
    Column() {
      Refresh({ refreshing: $$this.isRefreshing }) {
        List() {
          ForEach(this.dataSource, () => {
            ListItem() {
              RecommendItem()
            }
          })
        }
        .height("100%")
        .backgroundColor('#F8F9FD')
      }
      .onStateChange((refreshStatus: RefreshStatus) => {
        console.info('Refresh onStatueChange state is ' + refreshStatus)
      })
      .onRefreshing(() => {
        setTimeout(() => {
          this.counter++
          this.isRefreshing = false
        }, 1000)
        console.log('onRefreshing test')
      })

    }
  }
}

@Component
struct RecommendItem {
  // https://ulu-img.s3.ap-southeast-1.amazonaws.com/f9d3fbda0ae7b41a71c752f87a8f3dd3.jpg
  build() {
    Row() {
      Image("https://ulu-img.s3.ap-southeast-1.amazonaws.com/f9d3fbda0ae7b41a71c752f87a8f3dd3.jpg")
        .width(90)
        .height(68)
        .margin({ left: 12 })
        .borderRadius(8)
      Column() {
        Text("Human disappear for detection notification xxxxxxxxx yyyyyyyyy")
          .fontSize(16)
          .fontColor('#151617')
          .fontWeight(FontWeight.Medium)
          .width('80%')
        Text("lintest")
          .fontSize(12)
          .fontColor('#919293')
          .padding({ top: 2 })
        Text("10-10-2023")
          .fontSize(10)
          .fontColor('#919293')
          .padding({ top: 8 })
      }
      .alignItems(HorizontalAlign.Start)
      .margin({ left: 10 })
    }
    .backgroundColor(Color.White)
    .height(92)
    .margin({ left: 20, right: 20, top: 6, bottom: 6 })
    .borderRadius(15)
  }
}