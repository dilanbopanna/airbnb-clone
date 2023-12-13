type stay = {
  name: string,
  images: array<string>,
  rating: string,
  distance: string,
  price: string,
}

open LogicUtils 
let itemToObjectMapper = dict => {
  {
    name: getString(dict, "name", ""),
    images: getStrArrayFromDict(dict, "images", []),
    rating: getString(dict, "rating", ""),
    distance: getString(dict, "distance", ""),
    price: getString(dict, "price", ""),
  }
}
