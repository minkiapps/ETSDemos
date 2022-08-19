@Entry
@Component
struct Index {
  @Provide("wtf") minki: number = 1
  @State index: number = 0

  build() {
    Column() {
      Text(`${this.index} Minki: ${this.minki}`)
        .margin({ top: 16 })
        .fontSize(32)
      LinkUse({ index: $index })
      Button('Test Provide')
        .onClick((event) => {
          this.minki++
        }).margin({ top: 16 })
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct LinkUse {
  @Link @Watch("changeOdd") index: number;
  @Consume("wtf") minki: number;
  isOdd: boolean = false; //don't need to be state since index @watch will trigger a rebuild

  changeOdd() {
    this.isOdd = this.index % 2 != 0;
  }

  build() {
    Column() {
      Button(`Link usage: ${this.index}, isOdd: ${this.isOdd}, Minki ${this.minki}`).onClick(() => {
        this.index++;
        this.minki++;
      })

      PropUse({ index: this.index })
    }.margin({ top: 16 })
  }
}

@Component
struct PropUse {
  @Prop index: number;
  @Consume("wtf") minki: number

  build() {
    Column() {
      Text(`PropUse ${this.index}`)
        .fontSize(24)
        .margin({ top: 16 })

      Button(`Minki2 ${this.minki}`).onClick(() => {
        //this.index++;
        this.minki++;
      }).margin({ top: 16 })

    }
  }
}