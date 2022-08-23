import {GetBingNews} from '../../data/BingData'
import {BingNews} from '../../model/BingModels'

@Entry
@Component
export struct BingPage {
  @StorageLink('bingResult') news: Array<BingNews> = []

  aboutToAppear() {
    console.log('Bing page appeared')

    GetBingNews()
  }

  aboutToDisappear() {
    console.log('Bing page disappeared')
  }

  build() {
    Column() {
      List() {
        ForEach(this.news, item => {
          ListItem() {
            BingNewsListItem({ news: item })
          }
        }, item => this.news.indexOf(item).toString())
      }.height('100%')
    }
  }
}

@Component
struct BingNewsListItem {
  private news: BingNews

  build() {
    Hyperlink(this.news.url) {
      Column() {
        if (!!this.news.imageUrl) {
          Image(this.news.imageUrl)
            .width('80%')
            .objectFit(ImageFit.Fill)
        }


        Text(this.news.title)
          .margin({ top: 4 })
          .width('100%')
          //.fontColor($r('sys.color.id_color_text_primary'))
          .fontSize(24)

        Text(this.news.description)
          .margin({ top: 4 })
          .width('100%')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          //.fontColor($r('sys.color.id_color_text_secondary'))

        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.End }) {
          Image(this.news.providerImageUrl)
            .width('10%')
            .objectFit(ImageFit.Fill)
          Text(this.news.providerName)
            //.fontColor($r('sys.color.id_color_text_secondary'))
            .fontSize(14)
            .margin({ top: 2 })
        }.width('100%')

        Text(new Date(this.news.datePublished).toLocaleString())
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