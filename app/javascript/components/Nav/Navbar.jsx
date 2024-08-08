import React from "react";
import { Link } from "react-router-dom";

export const Nav = () => {
	return (
		<nav className="navbar navbar-expand-lg">
			<div className="container">
				<Link className="navbar-brand" to="/">RecipeBook</Link>
				<button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span className="navbar-toggler-icon"></span>
				</button>
				<div className="collapse navbar-collapse" id="navbarSupportedContent">
					<ul className="navbar-nav me-auto mb-2 mb-lg-0">
						<li className="nav-item">
							<Link to={"/search?filter=quick-prep"} className="nav-link active" aria-current="page">Quickest</Link>
						</li>
						<li className="nav-item">
							<Link className="nav-link" to={"/search?filter=popular"}>Popular</Link>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	)
}

