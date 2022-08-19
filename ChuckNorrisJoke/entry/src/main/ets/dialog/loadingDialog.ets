@CustomDialog
export struct LoadingDialog {
  controller: CustomDialogController
  @State angle: number = 0

  build() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Image($r("app.media.ic_loading_dialog"))
        .width(50)
        .height(50)
        .rotate({
          x: 0,
          y: 0,
          z: 1,
          angle: this.angle,
          centerX: '50%',
          centerY: '50%'
        })
        .animation({
          duration: 1500,
          iterations: -1,
        })
        .onAppear(() => {
          this.angle = 360
        })

      Text($r('app.string.loading_text'))
        .fontSize(14)
        .fontColor(Color.White)
    }.width(100).height(100)
    .backgroundColor('#b3000000')
    .borderRadius(10)
  }
}