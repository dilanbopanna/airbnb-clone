@module("./stays.json") external stays: Js.Json.t = "default"

let swapElements = (arr, i, j) => {
  let newArray = Array.copy(arr)
  let temp = newArray[i]
  newArray[i] = newArray[j]
  newArray[j] = temp
  newArray
}

let rec shuffleArray = (arr, i) => {
  switch i {
  | 0 => arr
  | _ => {
      let j = Js.Math.random_int(0, i)
      let newArr = swapElements(arr, i, j)
      shuffleArray(newArr, i - 1)
    }
  }
}

module DisplayCarousel = {
  @react.component
  let make = (~stays, ~i) => {
    let (isLoading, setIsLoading) = React.useState(_ => true)

    Js.Global.setTimeout(() => {
      setIsLoading(_ => false)
    }, (i + 1) * 100)->ignore

    <Carousel stays={stays} loading={isLoading} />
  }
}

@react.component
let make = (~selected) => {
  let stays = React.useMemo1(() => {
    let arr = stays->Js.Json.decodeArray->Belt.Option.getWithDefault([])
    shuffleArray(arr, arr->Js.Array2.length - 1)
  }, [selected])

  <div
    className="px-5 md:px-10 lg:px-16 my-10 flex flex-wrap flex-row gap-10 overflow-scroll justify-center lg:justify-start lg">
    {stays
    ->Js.Array2.mapi((item, i) => {
      let stays =
        item
        ->Js.Json.decodeObject
        ->Belt.Option.getWithDefault(Js.Dict.empty())
        ->Stay.itemToObjectMapper
      <DisplayCarousel stays i />
    })
    ->React.array}
  </div>
}
