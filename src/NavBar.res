module ProfileItem = {
  @react.component
  let make = (~item, ~className="font-light") => {
    <div className={`p-3 px-5 pr-24 hover:bg-[#f7f7f7] w-full text-[#222222] ${className}`}>
      {React.string(item)}
    </div>
  }
}

module SearchDateItem = {
  @react.component
  let make = (~text1, ~text2) => {
    <div
      className="p-2 px-8 cursor-pointer h-full hover:bg-[#ebebeb] hover:bg-clip-padding rounded-full flex justify-center items-center flex-col ">
      <div className="font-bold self-start text-[12px] tracking-wide"> {React.string(text1)} </div>
      <div className="font-light self-start text-[14px] text-[#717171]">
        {React.string(text2)}
      </div>
    </div>
  }
}

@react.component
let make = () => {
  open Types
  let (openProfile, setOpenProfile) = React.useState(_ => false)
  let (openSearch, setOpenSearch) = React.useState(_ => false)
  let (catagory, setCatagory) = React.useState(_ => Stays)
  let (hover, setHover) = React.useState(_ => false)
  let profileRef = React.useRef(Js.Nullable.null)
  let navRef = React.useRef(Js.Nullable.null)
  OutsideClick.useOutsideClick(
    ~refs=ArrayOfRef([profileRef]),
    ~isActive=openProfile,
    ~callback=() => {
      setOpenProfile(x => !x)
    },
    (),
  )
  OutsideClick.useOutsideClick(
    ~refs=ArrayOfRef([navRef]),
    ~isActive=openSearch,
    ~callback=() => {
      setOpenSearch(x => !x)
    },
    (),
  )
  let breakLine =
    <div className={`h-auto w-[1px] ${!hover ? "bg-[#dddddd]" : "bg-transparent"} my-2`} />
  <div className="w-screen h-screen">
    <div
      className={`sticky ${!openSearch
          ? "h-20"
          : "h-20 sm:h-40"} border border-b-[#ebebeb] flex flex-col`}
      ref={navRef->ReactDOM.Ref.domRef}
      style={ReactDOMStyle.make(~transition="height 0.5s ease", ())}>
      <div
        className="flex flex-row items-center justify-between px-5 md:px-10 lg:px-16 h-auto py-4">
        <div className="text-[#fe385c] xl:w-1/3 hidden md:flex"> {AirbnbSvg.bnbwithtext} </div>
        <div className="text-[#fe385c] xl:w-1/3 hidden md:hidden sm:flex">
          {AirbnbSvg.bnblogo}
        </div>
        <Search openSearch setOpenSearch catagory setCatagory />
        <div className="hidden sm:flex flex-row xl:w-1/3  justify-end">
          <div className="font-medium text-sm flex flex-row gap-2 items-center cursor-pointer">
            <div
              className="h-11 hidden xl:flex hover:bg-[#f7f7f7] rounded-full p-4  transition-colors items-center justify-center">
              {React.string("Airbnb your home")}
            </div>
            <div
              className="h-11 hidden lg:flex hover:bg-[#f7f7f7] rounded-full p-4 transition-colors items-center justify-center">
              <Icon name="world" size=16 />
            </div>
            <div
              className="flex flex-row gap-1 md:gap-3 p-1 px-2 ml-2 pl-3 border border-[#dddddd] rounded-full h-11 shadow-[#000000]/10 hover:shadow-md transition-shadow items-center justify-center"
              onClick={_ => setOpenProfile(prev => !prev)}>
              <Icon name="hamburger" size=16 className="text-[#222222] " />
              <Icon name="avatar" size=29 className="text-[#717171]" />
              {openProfile
                ? <div
                    className="flex bg-white flex-col absolute top-16 right-16 rounded-xl h-auto transition-shadow items-center justify-center min-w-max py-2 mt-2"
                    style={ReactDOMStyle.make(~boxShadow="rgba(0, 0, 0, 0.24) 0px 3px 8px", ())}
                    ref={profileRef->ReactDOM.Ref.domRef}>
                    <ProfileItem item="Sign up" className="font-semibold" />
                    <ProfileItem item="Log in" />
                    <div className="w-full h-[1px] bg-[#dddddd] my-2" />
                    <ProfileItem item="Airbnb your home" />
                    <ProfileItem item="Host an experience" />
                    <ProfileItem item="Help" />
                  </div>
                : React.null}
            </div>
          </div>
        </div>
      </div>
      {openSearch
        ? <div className="hidden sm:flex justify-center items-center">
            <div
              className="h-16  flex flex-row w-auto border border-[#dddddd] rounded-full"
              onMouseEnter={_ => setHover(_ => true)}
              onMouseLeave={_ => setHover(_ => false)}>
              <div
                className=" p-1 px-6 w-64 cursor-pointer h-full hover:bg-[#ebebeb] hover:bg-clip-padding rounded-full flex justify-center items-center flex-col ">
                <div className="font-bold pl-3 self-start text-[12px] tracking-wide">
                  {React.string("Where")}
                </div>
                <div className="font-medium pl-3 self-start text-[14px]">
                  {React.string("Map Area")}
                </div>
              </div>
              {breakLine}
              {switch catagory {
              | Online
              | Stays => <>
                  <SearchDateItem text1="Check in" text2="Add dates" />
                  {breakLine}
                  <SearchDateItem text1="Check out" text2="Add dates" />
                  {breakLine}
                </>
              | Experience => <>
                  <SearchDateItem text1="Check in" text2="Add dates" /> {breakLine}
                </>
              }}
              <div
                className=" p-2 pl-8 pr-3 cursor-pointer h-full hover:bg-[#ebebeb] hover:bg-clip-padding rounded-full flex justify-between gap-4 items-center flex-row">
                <div className="flex flex-col justify-center items-center">
                  <div className="font-bold  self-start text-[12px] tracking-wide">
                    {React.string("Who")}
                  </div>
                  <div className="font-light self-start text-[14px] text-[#717171]">
                    {React.string("Add guests")}
                  </div>
                </div>
                <div
                  className=" h-11 w-11 bg-[#fe385c] rounded-full flex justify-center items-center">
                  <Icon name="search" className="text-white" size=20 width=15 />
                </div>
              </div>
            </div>
          </div>
        : React.null}
    </div>
  </div>
}
