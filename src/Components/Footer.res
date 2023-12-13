@react.component
let make = () => {
  open Types
  let (mode, setMode) = React.useState(_ => Explore)
  <>
    <div
      className="h-auto w-screen fixed bg-white bottom-0 p-2 px-5 md:px-10 lg:px-16 border bordet-t-[#ebebeb] hidden md:flex flex-row justify-between">
      <div className="text-sm font-light text-[#585858]">
        {React.string(`© 2023 Airbnb Clone, Inc.  ·  Privacy  ·  Terms  ·  Sitemap  ·  Company details`)}
      </div>
      <div className="flex flex-row gap-4 text-medium text-sm items-center">
        <Icon name="world" size=16 />
        <div className="hover:underline"> {React.string("English (IN)")} </div>
        <div className="hover:underline"> {React.string(`₹ INR`)} </div>
        <div className="hover:underline"> {React.string("Support & resources")} </div>
      </div>
    </div>
    <div
      className="h-16 w-screen fixed bg-white bottom-0 p-2 px-5 md:px-10 lg:px-16 border bordet-t-[#ebebeb] flex md:hidden flex-row gap-10 justify-center items-center">
      <div
        className="flex flex-col gap-2 items-center justify-center"
        onClick={_ => setMode(_ => Explore)}>
        <Icon name="search-2" size=25 className={mode == Explore ? "text-[#ff385c]" : ""} />
        <div
          className={`text-xs  ${mode == Explore
              ? "text-[#222222] font-semibold"
              : "text-[#717171] font-medium"}`}>
          {React.string("Explore")}
        </div>
      </div>
      <div
        className="flex flex-col gap-2 items-center justify-center"
        onClick={_ => setMode(_ => Wishlists)}>
        <Icon name="heart" size=25 className={mode == Wishlists ? "text-[#ff385c]" : ""} />
        <div
          className={`text-xs ${mode == Wishlists
              ? "text-[#222222] font-semibold"
              : "text-[#717171] font-medium"}`}>
          {React.string("Wishlists")}
        </div>
      </div>
      <div
        className="flex flex-col gap-2 items-center justify-center"
        onClick={_ => setMode(_ => LogIn)}>
        <Icon name="profile" size=25 className={mode == LogIn ? "text-[#ff385c]" : ""} />
        <div
          className={`text-xs ${mode == LogIn
              ? "text-[#222222] font-semibold"
              : "text-[#717171] font-medium"}`}>
          {React.string("Log In")}
        </div>
      </div>
    </div>
  </>
}
