import dataStorage from '@ohos.data.storage';
import featureAbility from '@ohos.ability.featureAbility'

const STORAGE_PATH = '/myStore'

export class AppStorage {

  async setLike(like: boolean) {
    var dir = await featureAbility.getContext().getFilesDir()
    console.log('File dir path: ' + dir)
    let store = dataStorage.getStorageSync(dir + STORAGE_PATH)
    store.putSync('liked', like)
    store.flushSync()
  }

  async getIsLiked() {
    var dir = await featureAbility.getContext().getFilesDir()
    let store = dataStorage.getStorageSync(dir + STORAGE_PATH)
    var v = store.getSync('liked', false)
    console.log('Has value: ' + store.hasSync('liked') + ' Like value: ' + v)
    return v as boolean
  }
}
