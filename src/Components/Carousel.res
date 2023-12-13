@react.component
let make = (~stays: Stay.stay, ~loading) => {
  let (like, setLike) = React.useState(_ => false)
  let (currentIndex, setCurrentIndex) = React.useState(_ => 0)
  let (showActions, setShowActions) = React.useState(_ => false)

  let goToNext = () => {
    setCurrentIndex(prevIndex => mod(prevIndex + 1, stays.images->Js.Array2.length))
  }

  let goToPrev = () => {
    setCurrentIndex(prevIndex =>
      mod(prevIndex - 1 + stays.images->Js.Array2.length, stays.images->Js.Array2.length)
    )
  }
  <div className="flex flex-col gap-2 w-80 md:w-64">
    <div
      className={`w-80 h-80 md:w-64 md:h-64 max-h-72 max-w-72 rounded-2xl relative select-none ${loading
          ? "bg-gray-300"
          : ""}`}
      onMouseEnter={_ => setShowActions(_ => true)}
      onMouseLeave={_ => setShowActions(_ => false)}>
      {!loading
        ? <>
            <Icon
              name="like"
              size=20
              className={`${like
                  ? "text-[#ff385c]"
                  : "text-[#00000080]"} absolute right-0 top-0 m-3 stroke-white cursor-pointer`}
              onClick={_ => setLike(prev => !prev)}
            />
            {showActions && currentIndex !== 0
              ? <div
                  className="h-[1.9rem] w-[1.9rem] rounded-full  flex justify-center items-center self-center -ml-8 bg-white cursor-pointer flex-row absolute left-10 top-[47%]"
                  style={ReactDOMStyle.make(~zIndex="2", ())}
                  onClick={_ => goToPrev()}>
                  <Icon name="left-chevron" size=12 />
                </div>
              : React.null}
            <img
              src={stays.images
              ->Belt.Array.get(currentIndex)
              ->Belt.Option.getWithDefault("/stays/thumbnail.png")}
              className="h-full w-full object-cover rounded-2xl cursor-pointer"
            />
            {showActions && currentIndex !== stays.images->Js.Array2.length - 1
              ? <div
                  className="h-[1.9rem] w-[1.9rem] rounded-full  flex justify-center items-center self-center -ml-8 bg-white cursor-pointer flex-row absolute right-2 top-[47%]"
                  style={ReactDOMStyle.make(~zIndex="2", ())}
                  onClick={_ => goToNext()}>
                  <Icon name="right-chevron" size=12 />
                </div>
              : React.null}
          </>
        : React.null}
    </div>
    <div>
      <div className="flex flex-row justify-between items-center">
        <div className="font-semibold font-[#222222]"> {React.string(stays.name)} </div>
        <div className="flex flex-row gap-1 items-center justify-center">
          <Icon name="star" size=13 className="mt-[-0.26px]" />
          <div className=""> {React.string(stays.rating)} </div>
        </div>
      </div>
      <div className="font-light text-base text-[#717171] mt-[-0.1em]">
        {React.string(stays.distance ++ " kilometers away")}
      </div>
      <div className="flex flex-row gap-1  mt-[0.5rem] text-[0.9375rem]">
        <div className="font-semibold"> {React.string(`₹ ` ++ stays.price)} </div>
        <div className=""> {React.string("night")} </div>
      </div>
    </div>
  </div>
}
