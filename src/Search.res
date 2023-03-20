@react.component
let make = () => {
  <>
    <div
      className="hidden sm:flex flex-row p-2 border border-[#dddddd] rounded-full gap-5 text-sm h-12 cursor-pointer shadow shadow-[#000000]/10 hover:shadow-md transition-shadow w-max xl:w-auto">
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
