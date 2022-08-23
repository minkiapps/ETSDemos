import fetch from '@system.fetch';
import {BingNews, Wrapper} from '../model/BingModels'
import {API_KEY} from './keys'

const BING_URL = 'https://bing-news-search1.p.rapidapi.com/news'

export function GetBingNews() {
  fetch.fetch({
    url: BING_URL,
    "method": 'GET',
    "data": {
      "safeSearch": 'OFF'
    },
    "header": {
      "x-bingapis-sdk": "true",
      "x-rapidapi-host": "bing-news-search1.p.rapidapi.com",
      "x-rapidapi-key": API_KEY
    },
    success: (response) => {
      console.log("Response Code: " + response.code)
      console.log(response.data as string)
      if (response.code == 200) {
        AppStorage.SetOrCreate('bingResult', wrapIntoNews(response.data))
      } else {
        console.log('Failed to get data: ' + response.data)
      }
    },
    fail: (data) => {
      console.log("Fetch Bing News failed: " + data)
    },
    complete: () => {
      console.log("Fetch Bing News complete")
    }
  })
}

function wrapIntoNews(data: any): BingNews[] {
  let wrapper: Wrapper = JSON.parse(data)

  wrapper.value.forEach((item) => {
    console.log(item.name)
    console.log(item.url)
    console.log(item.image?.thumbnail?.contentUrl)
    console.log(item.description)
    console.log(item.provider?.[0]?.name)
    console.log(item.provider?.[0]?.image?.thumbnail?.contentUrl)
    console.log(item.datePublished)
  })

  return wrapper.value.map<BingNews>((item) =>
    new BingNews(
      item.name ?? '',
      item.url ?? '',
      item.image?.thumbnail?.contentUrl ?? '',
      item.description,
      item.provider?.[0]?.name ?? '',
      item.provider?.[0]?.image?.thumbnail?.contentUrl ?? '',
      item.datePublished
    )
  )
}