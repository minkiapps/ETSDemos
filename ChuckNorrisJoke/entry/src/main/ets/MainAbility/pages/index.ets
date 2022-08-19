import { FetchJoke } from '../../api/FetchJoke';
import dayjs from 'dayjs'
import { LoadingDialog } from '../../dialog/loadingDialog';

@Entry
@Component
struct Index {
  aboutToAppear() {
    console.log(`Index page appeared ${dayjs()}`)
  }

  aboutToDisAppear() {
    console.log("Index page disappeared")
  }

  build() {
    Column() {
      JokeLayout()
      Blank()
      DayFooter()
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct JokeLayout {
  build() {
    Column() {
      JokeView()
      JokeRating()
    }
  }
}

@Component
struct JokeView {
  private loadingDialog: CustomDialogController = new CustomDialogController({
    builder: LoadingDialog(), customStyle: true })
  @State jokeText: string = 'Jokes comes here'

  build() {
    Column() {

      Text(this.jokeText)
        .fontSize(24)
        //.fontColor($r('sys.color.ohos_id_color_text_primary')) //TODO why not work
        .width('100%')
        .textAlign(TextAlign.Center)
        .fontWeight(FontWeight.Medium)
        .padding({ left: 16, right: 16 })
        .margin({ top: 16 })

      Button($r('app.string.chuck_norris_reload_joke'))
        .margin({ top: 16 })
        .fontSize(24)
        .onClick(() => {
          this.loadingDialog.open()

          FetchJoke(
            (joke) => {
              this.jokeText = joke.value
            },
            (data) => { },
            () => {
              this.loadingDialog.close() //TODO why not work on real device
            }
          )
        })
    }
  }
}

@Component
struct JokeRating {
  @State rating: number = 0

  build() {
    Column() {
      Text('Joke rating score: ' + this.rating)
        //.fontColor($r('sys.color.ohos_id_color_text_primary'))
        .fontSize(20)
      Rating({ rating: this.rating })
        .stars(5)
        .stepSize(0.5)
        .margin({ top: 16 })
        .onChange((value: number) => {
          this.rating = value
        })
    }.padding(35)
  }
}

@Component
struct DayFooter {
  build() {
    Column() {
      Navigator({ target: 'pages/detailpage', type: NavigationType.Push }) {
        Image($r("app.media.chucknorris"))
          .size({ width: 100, height: 100 })
          .border({ width: 2, radius: 50 })
          .sharedTransition("chuck_norris")
      }.margin({ top: 16 })

      Text(dayjs().toString())
        .fontSize(20)
        .margin({ top: 8, bottom: 8 })
      //.fontColor($r('sys.color.ohos_id_color_text_primary'))
    }
  }
}