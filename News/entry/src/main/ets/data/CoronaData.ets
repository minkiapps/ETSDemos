import fetch from '@system.fetch';
import {CoronaNews, Wrapper} from '../model/CoronaModels'
import {API_KEY, API_KEY_2} from './keys'

import {US_DATA, CN_DATA, DE_DATA, FR_DATA, GB_DATA, RU_DATA, CA_DATA, IT_DATA, IN_DATA, AU_DATA, JP_DATA, KR_DATA} from './CoronaNewsDebugData'

const IS_DEBUG = false
const CORONA_URL = 'https://coronavirus-smartable.p.rapidapi.com/news/v1/'

export function GetCoronaNews(
    countryIsoCode: string,
    success: (bingNews: CoronaNews[]) => void,
    failure: (data: any) => void,
) {
  if(IS_DEBUG) {
    let jsonString : string
    switch(countryIsoCode) {
      case 'US' :
        jsonString = US_DATA
        break
      case 'CN' :
        jsonString = CN_DATA
        break
      case 'DE' :
        jsonString = DE_DATA
        break
      case 'FR' :
        jsonString = FR_DATA
        break
      case 'GB' :
        jsonString = GB_DATA
        break
      case 'CA' :
        jsonString = CA_DATA
        break
      case 'RU' :
        jsonString = RU_DATA
        break
      case 'CA' :
        jsonString = CA_DATA
        break
      case 'IT' :
        jsonString = IT_DATA
        break
      case 'IN' :
        jsonString = IN_DATA
        break
      case 'AU' :
        jsonString = AU_DATA
        break
      case 'JP' :
        jsonString = JP_DATA
        break
      case 'KR' :
        jsonString = KR_DATA
        break
      default:
        jsonString = US_DATA
        break;
    }

    success(wrapIntoNews(jsonString))
    return
  }

  fetch.fetch({
    url: CORONA_URL + countryIsoCode + '/',
    "method": 'GET',
    "header": {
      "x-bingapis-sdk": "true",
      "x-rapidapi-host": "coronavirus-smartable.p.rapidapi.com",
      "x-rapidapi-key": API_KEY
    },
    success: (response) => {
      console.log("Response Code: " + response.code)
      console.log(response.data as string)
      if (response.code == 200) {
        success(wrapIntoNews(response.data))
      } else {
        failure(response.data)
      }
    },
    fail: (data) => {
      console.log("Fetch Corona News failed: " + data)
      failure(data)
    },
    complete: () => {
      console.log("Fetch Corona News complete")
    }
  })
}

function wrapIntoNews(data: any): CoronaNews[] {
  let wrapper: Wrapper = JSON.parse(data)
  return wrapper.news.map<CoronaNews>((item) =>
  new CoronaNews(
    item.title ?? '',
    item.excerpt ?? '',
    item.originalUrl ?? '',
    item.publishedDateTime ?? '',
    item.provider?.name ?? '',
    item.images?.[0]?.url ?? '',
  )
  )
}