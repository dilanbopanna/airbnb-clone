module ProfileItem = {
  @react.component
  let make = (~item, ~className="font-light") => {
    <div className={`p-3 px-5 pr-24 hover:bg-[#f7f7f7] w-full text-[#222222] ${className}`}>
      {React.string(item)}
    </div>
  }
}

@react.component
let make = () => {
  let (openProfile, setOpenProfile) = React.useState(_ => false)
  let profileRef = React.useRef(Js.Nullable.null)
  OutsideClick.useOutsideClick(
    ~refs=ArrayOfRef([profileRef]),
    ~isActive=openProfile,
    ~callback=() => {
      setOpenProfile(x => !x)
    },
    (),
  )

  <div
    className="sticky h-20 border border-b-[#ebebeb] px-5 md:px-10 lg:px-16 flex items-center justify-between">
    <div className="text-[#fe385c] xl:w-1/3 hidden md:flex"> {AirbnbSvg.bnbwithtext} </div>
    <div className="text-[#fe385c] xl:w-1/3 hidden md:hidden sm:flex"> {AirbnbSvg.bnblogo} </div>
    <Search />
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
}
