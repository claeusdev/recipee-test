import React from "react";
import { Link } from "react-router-dom";

const NavBar = () => {
	return (
		<nav class="navbar navbar-expand-lg">
			<div class="container">
				<Link class="navbar-brand" to="/">RecipeBook</Link>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item">
							<a class="nav-link active" aria-current="page" href="#">Recent</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">Popular</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	)
}

export default NavBar
