import { CountryTab } from '../model/NavigationTab';

const tabs: Array<CountryTab> = [
  { id: 0, name: 'US' },
  { id: 1, name: 'CN' },
  { id: 2, name: 'DE' },
  { id: 3, name: 'FR' },
  { id: 4, name: 'GB' },
  { id: 5, name: 'RU' },
  { id: 6, name: 'CA' },
  { id: 7, name: 'IT' },
  { id: 8, name: 'IN' },
  { id: 9, name: 'AU' },
  { id: 10, name: 'JP' },
  { id: 11, name: 'KR' }
]

@Component
export struct CountryTabs {

  @Watch('onTabIndexChange')
  @Link
  country : string

  tabsIndex : number = 0

  private screenWidth: number = AppStorage.Get<number>('screenWidth')
  private tabWidth: number = 100
  private scroller: Scroller = new Scroller()

  onTabIndexChange() {
    console.log('screenWidth: ' + this.screenWidth)
  }

  build() {
    Scroll(this.scroller) {
      Stack({ alignContent: Alignment.BottomStart }) {
        Row() {
          ForEach(tabs, (item : CountryTab) => {
            Flex({ justifyContent: FlexAlign.Center }) {
              Text(item.name)
                .fontSize(24)
                //.fontColor($r('sys.color.id_color_text_primary'))
                .fontWeight(FontWeight.Medium)
                .margin({ right : 4 })
              Image('https://purecatamphetamine.github.io/country-flag-icons/3x2/' + item.name + '.svg')
                .width(36)
                .height(24)
            }.width(this.tabWidth)
            .onClick((event) => {
              this.country = item.name
              this.tabsIndex = item.id
            })
          }, item => item.id)
        }.padding({ top: 8, bottom: 8 })

        Row()
          .width(100)
          .height(4)
          .borderRadius(2)
          .backgroundColor('#1E67DC')
          .offset({ x: this.tabsIndex * this.tabWidth })
      }
    }.scrollBar(BarState.Off)
    .scrollable(ScrollDirection.Horizontal)
  }
}