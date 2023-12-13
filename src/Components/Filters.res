module FilterItem = {
  @react.component
  let make = (~item: FilterUtils.filter, ~selected, ~setSelected) => {
    let (hover, setHover) = React.useState(_ => false)
    <div
      className="flex flex-col gap-1 items-center min-w-[3.7rem]"
      onMouseEnter={_ => setHover(_ => true)}
      onMouseLeave={_ => setHover(_ => false)}
      onClick={_ => setSelected(_ => item.type_)}>
      {item.icon}
      <div className="font-semibold text-xs"> {React.string(item.name)} </div>
      {selected == item.type_ || hover
        ? <div
            className={`absolute h-[2px] bg-[#222222] w-full bottom-0 ${hover &&
              selected != item.type_
                ? "opacity-50"
                : ""}`}
          />
        : React.null}
    </div>
  }
}
type boundingClient = {x: int, right: int}
type scrollIntoViewParams = {behavior: string, block: string, inline: string}
@send external scrollIntoView: (Dom.element, scrollIntoViewParams) => unit = "scrollIntoView"
@send external getBoundingClientRect: Dom.element => boundingClient = "getBoundingClientRect"

let scrollToLeft = (ref: React.ref<Js.Nullable.t<Dom.element>>) => {
  ref.current
  ->Js.Nullable.toOption
  ->Belt.Option.forEach(input =>
    input->scrollIntoView(_, {behavior: "smooth", block: "nearest", inline: "start"})
  )
}

let getBoundingRectInfo = (ref: React.ref<Js.Nullable.t<Dom.element>>, getter) => {
  ref.current
  ->Js.Nullable.toOption
  ->Belt.Option.map(getBoundingClientRect)
  ->Belt.Option.mapWithDefault(0, getter)
}

@react.component
let make = (~openProfile, ~selected, ~setSelected) => {
  let (isLeftArrowVisible, setIsLeftArrowVisible) = React.useState(() => false)
  let (isRightArrowVisible, setIsRightArrowVisible) = React.useState(() => true)
  let firstTabRef = React.useRef(Js.Nullable.null)
  let scrollRef = React.useRef(Js.Nullable.null)
  let lastTabRef = React.useRef(Js.Nullable.null)

  let onScroll = _ev => {
    let leftVal = firstTabRef->getBoundingRectInfo(val => val.x)
    let rightVal = lastTabRef->getBoundingRectInfo(val => val.right)
    let scrollValLeft = scrollRef->getBoundingRectInfo(val => val.x)
    let scrollValRight = scrollRef->getBoundingRectInfo(val => val.right)

    let newIsLeftArrowVisible = leftVal - scrollValLeft < 0
    let newIsRightArrowVisible = rightVal - scrollValRight >= 10

    setIsLeftArrowVisible(_ => newIsLeftArrowVisible)
    setIsRightArrowVisible(_ => newIsRightArrowVisible)
  }

  <div className="flex flex-row h-20 w-full shadow-md px-5 md:px-10 lg:px-16">
    {isLeftArrowVisible
      ? <div className="hidden sm:flex flex-row">
          <div
            className="h-[1.7rem] w-[1.7rem] rounded-full border border-[#c3c3c3] flex justify-center items-center self-center -mr-8 bg-white cursor-pointer flex-row"
            style={ReactDOMStyle.make(~zIndex="2", ())}
            onClick={_ => scrollToLeft(firstTabRef)}>
            <Icon name="left-chevron" size=11 />
          </div>
          <div
            className="w-14 h-full -mr-9"
            style={ReactDOMStyle.make(
              ~backgroundImage="linear-gradient(to left,rgb(255 255 255/0),white 30px",
              ~zIndex="1",
              (),
            )}
          />
        </div>
      : React.null}
    <div
      className="flex flex-row gap-8 w-full sm:w-[90%] overflow-x-scroll relative"
      ref={scrollRef->ReactDOM.Ref.domRef}
      onScroll>
      {FilterUtils.filters
      ->Js.Array2.mapi((item, i) => {
        let ref = if i == 0 {
          firstTabRef->ReactDOM.Ref.domRef->Some
        } else if i == FilterUtils.filters->Js.Array2.length - 1 {
          lastTabRef->ReactDOM.Ref.domRef->Some
        } else {
          None
        }
        <div
          className={`flex flex-col cursor-pointer min-w-fit transition-opacity mt-3 items-center relative gap-2 ${selected ==
              item.type_
              ? ""
              : "hover:opacity-100 opacity-50"}
          ${openProfile ? "z-[-2]" : ""}
          `}
          ?ref
          key={string_of_int(i)}>
          <FilterItem item selected setSelected />
        </div>
      })
      ->React.array}
    </div>
    {isRightArrowVisible
      ? <div className="hidden sm:flex flex-row">
          <div
            className="h-[1.7rem] w-[1.7rem] rounded-full border border-[#c3c3c3] flex justify-center items-center self-center -ml-8 bg-white cursor-pointer flex-row"
            style={ReactDOMStyle.make(~zIndex=openProfile ? "-1" : "2", ())}
            onClick={_ => scrollToLeft(lastTabRef)}>
            <Icon name="right-chevron" size=11 />
          </div>
          <div
            className="w-14 h-full -ml-9"
            style={ReactDOMStyle.make(
              ~backgroundImage="linear-gradient(to right,rgb(255 255 255/0), white 40px",
              ~zIndex="1",
              (),
            )}
          />
        </div>
      : React.null}
    <div className=" w-0 sm:w-[10%] m-auto hidden sm:flex justify-end ">
      <div
        className="flex flex-row justify-center border border-[#dddddd] rounded-xl w-fit p-4 gap-3 items-center cursor-pointer">
        <Icon name="filter" className="text-[#222222]" size=14 />
        <div className="text-xs font-medium text-[#222222]"> {React.string("Filters")} </div>
      </div>
    </div>
  </div>
}
