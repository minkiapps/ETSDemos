export interface Wrapper {
  value? : News[]
}

interface News {
  name? : string
  url? : string
  description? : string
  datePublished? : string
  provider? : Provider[]
  image? : Image
}

interface Provider {
  name? : string
  image? : Image
}

interface Image {
  thumbnail? : Thumbnail
}

interface Thumbnail {
  contentUrl? : string
}

export class BingNews {
  title: string
  url: string
  imageUrl: string
  description: string
  providerName: string
  providerImageUrl: string
  datePublished: string

  constructor(
    title: string,
    url: string,
    imageUrl: string,
    description: string,
    providerName: string,
    providerImageUrl: string,
    datePublished: string
  ) {
    this.title = title
    this.url = url
    this.imageUrl = imageUrl
    this.description = description
    this.providerName = providerName
    this.providerImageUrl = providerImageUrl
    this.datePublished = datePublished
  }
}