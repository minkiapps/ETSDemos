
@Entry
@Component
struct Index {
  @State counter: number = 0
  build() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Text(this.counter.toString())
        .fontSize(50)
      SubComponent({ value: $counter })
    }.width('100%')
  }
}

@Component
export struct SubComponent {
  @Link
  value : number

  build() {
    Button() {
      Text(this.value.toString())
        .fontColor('#ffffff')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
    }.width(300)
    .height(80)
    .onClick(() => {
      this.value++
    })
  }
}

