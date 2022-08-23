import {BottomTabs} from '../../ui/TabsNavigation'
import {BingPage} from './BingPage'
import {CoronaPage} from './CoronaPage'

@Entry
@Component
struct Index {
  private controller: TabsController = new TabsController()

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.End, justifyContent: FlexAlign.End }) {
      Tabs({ barPosition: BarPosition.Start, index: 0, controller: this.controller }) {
        TabContent() {
          BingPage()
        }

        TabContent() {
          CoronaPage()
        }

        TabContent() {
          Flex({ direction : FlexDirection.Column,
            justifyContent : FlexAlign.Center,
            alignItems : ItemAlign.Center }) {
            Text("Under Construction")
              .fontSize(32)
              .fontColor(Color.White)
          }.width('100%')
          .height('100%')
          .backgroundColor(Color.Blue)
        }

        TabContent() {
          Flex({ direction : FlexDirection.Column,
            justifyContent : FlexAlign.Center,
            alignItems : ItemAlign.Center }) {
            Text("Under Construction")
              .fontSize(32)
              .fontColor(Color.White)
          }.width('100%')
          .height('100%')
          .backgroundColor(Color.Green)
        }
      }
      .vertical(false)
      .scrollable(false)
      .barHeight(0)
      .onChange((index: number) => {
        console.info(index.toString())
      })

      BottomTabs({ controller: this.controller })
    }.width('100%')
    .height('100%')
  }
}