
export class NavigationTab {
  id: number;
  name: string | Resource;
  img: Resource;
  imgChecked: Resource;

  constructor(id: number, name: string | Resource, img: Resource, imgChecked: Resource) {
    this.id = id;
    this.name = name;
    this.img = img;
    this.imgChecked = imgChecked;
  }
}

export class CountryTab {
  id : number;
  name : string;

  constructor(id : number, name : string) {
    this.id = id
    this.name = name
  }
}