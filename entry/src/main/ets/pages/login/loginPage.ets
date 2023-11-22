import router from '@ohos.router'
import { Toast_successOrFailed } from '@isrc/easyui'

@Entry
@Component
struct LoginPage {
  @State toastVisibility: Visibility = Visibility.Hidden
  @State toastContent: string = '登录成功'

  build() {
    Column({ space: 30 }) {
      Toast_successOrFailed({ content: $toastContent, comp_visibility: $toastVisibility })
      TextInput({ placeholder: "请输入账号" })
        .type(InputType.Email).margin({ left: 50, right: 50 })
      TextInput({ placeholder: "请输入密码" })
        .type(InputType.Password).margin({ left: 50, right: 50 })
      Button('登录').onClick(() => {
        this.toastVisibility = Visibility.Visible

        setTimeout(() => {
          router.back()
        }, 2000)

      })
    }.justifyContent(FlexAlign.Center).height('100%')
  }
}