import { NavigationTab } from './../model/NavigationTab';

const bottomNavigations: Array<NavigationTab> = [
  {
    "id": 0,
    "name": $r("app.string.bing_news"),
    "img": $r("app.media.bing_news"),
    "imgChecked": $r("app.media.bing_news_checked")
  },
  {
    "id": 1,
    "name": $r("app.string.corona_news"),
    "img": $r("app.media.coronavirus"),
    "imgChecked": $r("app.media.coronavirus_checked")
  },
  {
    "id": 2,
    "name": $r("app.string.hacker_news"),
    "img": $r("app.media.hacker_news"),
    "imgChecked": $r("app.media.hacker_news_checked")
  },
  { "id": 3,
    "name": $r("app.string.financial_times"),
    "img": $r("app.media.financial_news"),
    "imgChecked": $r("app.media.financial_news_checked")
  }
];

@Component
export struct BottomTabs {
  @State bottomTabIndex: number = 0
  private controller: TabsController

  build() {
    Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceEvenly }) {
      ForEach(bottomNavigations, item => {
        Column() {
          Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
            if(this.bottomTabIndex === item.id) {
              Image(item.imgChecked)
                .width('100%')
                .height('100%')
                .objectFit(ImageFit.Contain)
            } else {
              Image(item.img) //TODO tint image white in dark mode
                .objectFit(ImageFit.Contain)
                .width('80%')
                .height('80%')
            }
          }.height('50%')

          Text(item.name)
            .margin({top : 4})
            //.fontColor($r('sys.color.id_color_text_primary'))
            .fontSize(14)
        }.onClick((event: ClickEvent) => {
          this.bottomTabIndex = item.id
          this.controller.changeIndex(item.id)
        })
      }, item => item.toString())
    }.width('100%')
    .height(64)
    .shadow({ radius : 8 })
  }
}