let getOptionString = (dict, key) => {
  dict->Js.Dict.get(key)->Belt.Option.flatMap(Js.Json.decodeString)
}

let getString = (dict, key, default) => {
  getOptionString(dict, key)->Belt.Option.getWithDefault(default)
}

let getStrArrayFromJsonArray = jsonArr => {
  jsonArr->Belt.Array.keepMap(Js.Json.decodeString)
}

let getStrArryFromJson = arr => {
  arr
  ->Js.Json.decodeArray
  ->Belt.Option.map(getStrArrayFromJsonArray)
  ->Belt.Option.getWithDefault([])
}


let getOptionStrArrayFromJson = json => {
  json->Js.Json.decodeArray->Belt.Option.map(getStrArrayFromJsonArray)
}

let getStrArrayFromDict = (dict, key, default) => {
  dict
  ->Js.Dict.get(key)
  ->Belt.Option.flatMap(getOptionStrArrayFromJson)
  ->Belt.Option.getWithDefault(default)
}