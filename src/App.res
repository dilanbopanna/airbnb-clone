// src/Test.res
@react.component
let make = () => {
  let (openProfile, setOpenProfile) = React.useState(_ => false)
  <div className="flex flex-col font-fig-tree">
    <div className="flex flex-col sticky top-0 z-1 bg-white">
      <NavBar openProfile setOpenProfile /> <Filters openProfile />
    </div>
    <Footer />
  </div>
}
