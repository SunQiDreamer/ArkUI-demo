import router from '@ohos.router'

@Component
export struct HomePage {
  build() {
    Column() {
      Text('推荐的内容').fontSize(30)
      Button('登录').onClick(() => {
        router.pushUrl({ url: "pages/login/loginPage" })
      })
    }
  }
}