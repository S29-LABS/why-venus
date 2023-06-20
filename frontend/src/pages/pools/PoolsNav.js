function PoolsNav() {
    return (
        <nav className="font-sans text-white grid grid-cols-3 h-24 items-center gap-20 py-18">
            <div className="row-cols-1 text-center text-2xl text-green-400 font-semibold cursor-pointer">
                whyVenus  &#129680;
            </div>
            <div className="row-cols-2  ">
                <ul className="flex gap-10 justify-end">
                    <li className="cursor-pointer text-slate-300 hover:text-white">Collections</li>
                    <li className="cursor-pointer text-slate-300 hover:text-white">Pools</li>
                </ul>
            </div>
            <div className="row-cols-3 text-center">
                <div className="flex gap-10 justify-center ">
                    <div className="cursor-pointer text-slate-300">
                        Wallet
                    </div>
                    <div className="cursor-pointer text-slate-300">
                        Cart
                    </div>
                </div>   
            </div>
        </nav>
    )
}

export default PoolsNav;