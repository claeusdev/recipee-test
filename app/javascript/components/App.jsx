import React from "react";
import { Outlet } from "react-router";
import { Nav } from "./Nav";


export default () => <>
	<div className="min-vh-100  primary-color">
		<Nav />
		<div className="container">
			<Outlet />
		</div>
	</div>
</>;
