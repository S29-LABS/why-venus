import PoolsNav from "./pages/pools/PoolsNav";
import PoolsBody from "./pages/pools/PoolsBody";
import PoolsFooter from "./pages/pools/PoolsFooter";
function App() {
  return (
      <div className="bg-[#111827] m-0 p-0 border-0">
          <PoolsNav />
          <PoolsBody />
          <PoolsFooter />
      </div>
  )
}
export default App;
