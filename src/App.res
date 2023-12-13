// src/Test.res
@react.component
let make = () => {
  let (openProfile, setOpenProfile) = React.useState(_ => false)
  let (selected, setSelected) = React.useState(_ => FilterUtils.filters[0].type_)
  <div className="flex flex-col font-fig-tree">
    <div className="flex flex-col sticky top-0 z-10 bg-white">
      <NavBar openProfile setOpenProfile /> <Filters openProfile selected setSelected />
    </div>
    <ViewStays selected/>
    <Footer />
  </div>
}
