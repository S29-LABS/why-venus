import { AiFillGithub } from 'react-icons/ai'
import { IconContext } from "react-icons";
function PoolsFooter() {
    return (
        
            
            <footer className="h-[12.468749rem] px-64 py-10">
                <IconContext.Provider value={{ color: "white", className: "global-class-name", size: "20px" }}>
                    <div className="flex flex-row py-10 ">
                       <div className="flex flex-row items-center text-white cursor-pointer">
                            Code &nbsp; <AiFillGithub/>
                       </div>
                    </div>
                </IconContext.Provider>
            </footer>
    
    )
}

export default PoolsFooter;