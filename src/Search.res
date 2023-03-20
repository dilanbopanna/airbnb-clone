module CatagoryItem = {
  @react.component
  let make = (~catagory, ~setCatagory, ~selected) => {
    let (hover, setHover) = React.useState(_ => false)
    open Types
    let lineItem = switch catagory {
    | Stays => "Stays"
    | Experience => "Experiences"
    | Online => "Online Experiences"
    }
    let isSelected = catagory == selected

    <div
      className="font-light text-base relative cursor-pointer "
      onClick={_ => setCatagory(_ => catagory)}
      onMouseEnter={_ => setHover(_ => true)}
      onMouseLeave={_ => setHover(_ => false)}>
      {React.string(lineItem)}
      <div
        className="absolute h-[2px] origin-center mt-1"
        style={ReactDOMStyle.make(
          ~background=hover ? "#222222" : "",
          ~width=hover ? "100%" : "0",
          ~transform=hover ? "scaleX(1)" : "",
          ~transition=hover ? "width .3s ease, background-color .3s ease" : "",
          (),
        )}
      />
      {isSelected ? <div className="absolute h-[2px] bg-[#222222] w-full mt-1" /> : React.null}
    </div>
  }
}

@react.component
let make = (~openSearch, ~setOpenSearch, ~catagory, ~setCatagory) => {
  open Types
  let (hide, setHide) = React.useState(_ => false)

  React.useEffect1(() => {
    let _ = Js.Global.setTimeout(() => {
      setHide(prev => !prev)
    }, 400)
    None
  }, [openSearch])

  <>
    {hide
      ? <div
          className={`hidden sm:flex flex-row p-2 border border-[#dddddd] rounded-full gap-5 text-sm h-12 cursor-pointer shadow shadow-[#000000]/10 hover:shadow-md transition-shadow w-max xl:w-auto`}
          onClick={_ => setOpenSearch(_ => true)}
          style={ReactDOMStyle.make(
            ~transform=openSearch ? " scale(2.2, 1.8)" : "",
            ~transition=openSearch ? "transform 400ms ease, opacity 0.4s ease" : "",
            ~opacity=!openSearch ? "1" : "0",
            (),
          )}>
          <div className="font-medium pl-3 self-center"> {React.string("Anywhere")} </div>
          <div className="h-auto w-[1px] bg-[#dddddd]" />
          <div className="font-medium self-center"> {React.string("Any week")} </div>
          <div className="h-auto w-[1px] bg-[#dddddd]" />
          <div className="flex flex-row gap-2">
            <div className="text-[#717171] font-light self-center pr-1">
              {React.string("Add guests")}
            </div>
            <div className=" h-7 w-7 bg-[#fe385c] rounded-full flex justify-center items-center">
              <Icon name="search" className="text-white" size=15 width=12 />
            </div>
          </div>
        </div>
      : React.null}
    {!hide && openSearch
      ? <div
          className="hidden sm:flex flex-col"
          style={ReactDOMStyle.make(
            ~transition=hide ? "transform 400ms ease, opacity 0.4s ease" : "",
            ~opacity=hide ? "0" : "1",
            (),
          )}>
          <div className="flex flex-row gap-6 ">
            <CatagoryItem setCatagory catagory=Stays selected=catagory />
            <CatagoryItem setCatagory catagory=Experience selected=catagory />
            <CatagoryItem setCatagory catagory=Online selected=catagory />
          </div>
        </div>
      : React.null}
    <div
      className="flex sm:hidden w-full flex-row p-2 border border-[#dddddd] rounded-full gap-6 text-sm h-14 cursor-pointer shadow shadow-[#000000]/10 items-center px-3 text-[#4e4e4e]">
      <div className="flex flex-row justify-between items-center w-full">
        {<div className="flex flex-row gap-4 justify-center items-center">
          <Icon name="search" className="text-[#4e4e4e]" size=18 />
          <div className="flex flex-col">
            <div className="font-semibold"> {React.string("Anywhere")} </div>
            <div className="flex flex-row gap-1 text-xs font-[#797979]">
              <div className="font-light"> {React.string("Any week")} </div>
              <div className="font-semibold"> {React.string(`•`)} </div>
              <div className="font-light"> {React.string("Add guests")} </div>
            </div>
          </div>
        </div>}
        {<div>
          <div
            className="h-10 w-10 border border-[#dddddd] rounded-full flex justify-center items-center">
            <Icon name="filter" className="text-black" size=16 />
          </div>
        </div>}
      </div>
    </div>
  </>
}
