import React from "react";
import { Outlet } from "react-router";
import NavBar from "./Navbar";

export default () => <>
	<div className="vw-100 min-vh-100 mh-100 bg-light primary-color">
		<NavBar />
		<div className="container">

			<Outlet />
		</div>
	</div>

</>;
