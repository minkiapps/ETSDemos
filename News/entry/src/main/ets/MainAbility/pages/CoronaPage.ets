import {CoronaNews} from '../../model/CoronaModels'
import {GetCoronaNews} from '../../data/CoronaData'
import {CountryTabs} from '../../ui/CoronaTopTabs'

@Entry
@Component
export struct CoronaPage {

  @State news: Array<CoronaNews> = []

  @Watch("loadNews")
  @State country : string = 'US'

  private loadNews() {
    this.news = []
    GetCoronaNews(this.country, (news) => {
      this.news = news
    }, (data) => {
      console.log('Failed to get data: ' + data)
    })
  }

  aboutToAppear() {
    this.loadNews()
  }

  build() {
    Column() {
      CountryTabs({ country : $country })
      List() {
        ForEach(this.news, item => {
          ListItem() {
            Hyperlink(item.url) {
              Column() {
                if (!!item.imageUrl) {
                  Image(item.imageUrl)
                    .width('100%')
                    .objectFit(ImageFit.Fill)
                }

                Text(item.title)
                  .margin({ top: 4 })
                  .width('100%')
                    //.fontColor($r('sys.color.id_color_text_primary'))
                  .fontSize(24)

                Text(item.excerpt)
                  .margin({ top: 4 })
                  .width('100%')
                  .fontSize(16)
                  .fontWeight(FontWeight.Medium)
                //.fontColor($r('sys.color.id_color_text_secondary'))

                Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.End }) {
                  Text(item.providerName)
                    //.fontColor($r('sys.color.id_color_text_secondary'))
                    .fontSize(14)
                    .margin({ top: 2 })
                }.width('100%')

                Text(new Date(item.publishedDateTime).toLocaleString())
                  .width('100%')
                  .fontWeight(FontWeight.Medium)
                  //.fontColor($r('sys.color.id_color_text_secondary'))

                Divider()
                  .margin({ top: 4 })
                  .height(1)
              }.padding(8)
            }
            //CoronaNewsListItem({ news : item })
          }
        }, item => this.news.indexOf(item).toString())
      }.height('100%')
    }
  }
}

@Component
struct CoronaNewsListItem {
  private news: CoronaNews

  build() {
    Hyperlink(this.news.url) {
      Column() {
        if (!!this.news.imageUrl) {
          Image(this.news.imageUrl)
            .width('100%')
            .objectFit(ImageFit.Fill)
        }

        Text(this.news.title)
          .margin({ top: 4 })
          .width('100%')
          //.fontColor($r('sys.color.id_color_text_primary'))
          .fontSize(24)

        Text(this.news.excerpt)
          .margin({ top: 4 })
          .width('100%')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          //.fontColor($r('sys.color.id_color_text_secondary'))

        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.End }) {
          Text(this.news.providerName)
            //.fontColor($r('sys.color.id_color_text_secondary'))
            .fontSize(14)
            .margin({ top: 2 })
        }.width('100%')

        Text(new Date(this.news.publishedDateTime).toLocaleString())
          .width('100%')
          .fontWeight(FontWeight.Medium)
          //.fontColor($r('sys.color.id_color_text_secondary'))

        Divider()
          .margin({ top: 4 })
          .height(1)
      }.padding(8)
    }
  }
}