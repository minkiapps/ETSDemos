export interface Wrapper {
  news?: News[]
}

interface News {
  title?: string
  excerpt?: string
  originalUrl?: string
  publishedDateTime?: string
  provider?: Provider
  images?: Image[]
}

interface Provider {
  name?: string
  domain?: string
}

interface Image {
  url?: string
}

export class CoronaNews {
  title: string
  excerpt: string
  url: string
  publishedDateTime: string
  providerName: string
  imageUrl?: string

  constructor(
    title: string,
    excerpt: string,
    url: string,
    publishedDateTime: string,
    providerName: string,
    imageUrl: string
  ) {
    this.title = title
    this.excerpt = excerpt
    this.url = url
    this.publishedDateTime = publishedDateTime
    this.providerName = providerName
    this.imageUrl = imageUrl
  }
}