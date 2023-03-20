module FilterItem = {
  @react.component
  let make = (~item: FilterUtils.filter, ~selected, ~setSelected, ~openProfile) => {
    let (hover, setHover) = React.useState(_ => false)
    <div
      className={`flex flex-col cursor-pointer min-w-fit transition-opacity mt-3 items-center relative gap-2 ${selected ==
          item.type_
          ? ""
          : "hover:opacity-100 opacity-50"}
          ${openProfile ? "z-[-2]" : ""}
          `}
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

@react.component
let make = (~openProfile) => {
  let (selected, setSelected) = React.useState(_ => FilterUtils.filters[0].type_)
  <div className=" hidden sm:flex flex-row border h-20 w-full shadow-sm px-5 md:px-10 lg:px-16">
    <div className="flex flex-row gap-8 w-[90%] overflow-x-scroll">
      {FilterUtils.filters
      ->Js.Array2.map(item => {
        <FilterItem item selected setSelected openProfile />
      })
      ->React.array}
    </div>
    <div className=" w-[10%] m-auto flex justify-end ">
      <div
        className="flex flex-row justify-center border border-[#dddddd] rounded-xl w-fit p-4 gap-3 items-center cursor-pointer">
        <Icon name="filter" className="text-[#222222]" size=14 />
        <div className="text-xs font-medium text-[#222222]"> {React.string("Filters")} </div>
      </div>
    </div>
  </div>
}
