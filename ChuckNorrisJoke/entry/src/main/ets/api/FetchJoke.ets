import { Joke } from './Joke';
import fetch from '@system.fetch';

export function FetchJokeLight(success: (joke: Joke) => void) {
  FetchJoke(success, (data) => {}, () => {})
}

export function FetchJoke(
    success: (joke: Joke) => void,
    failure: (data: any) => void,
    complete: () => void
) {
  fetch.fetch({
    url: "https://api.chucknorris.io/jokes/random",
    method: 'GET',
    success: (response) => {
      console.log(response.data as string)
      let joke: Joke = JSON.parse(response.data as string)
      console.log('Joke: ' + joke.value)

      success(joke)
    },
    fail: (data) => {
      console.log("Fetch fail: " + data)
      failure(data)
    },
    complete: () =>  {
      console.log("Fetch joke completed");
      complete()
    }
  })
}