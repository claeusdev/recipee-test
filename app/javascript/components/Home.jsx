import React, { useEffect } from "react";
import { Link } from "react-router-dom";
import { sendRequest } from "../api";

import { useRecipeContext } from "../state";
import { getResponseData, dasherizeName } from "../utils";

export default () => {
	const { state, dispatch } = useRecipeContext();

	useEffect(() => {
		loadHomePage()
	}, [])

	async function loadHomePage() {
		const categories = await sendRequest("home");
		dispatch({ type: 'SET_CATEGORIES', payload: { categories: getResponseData(categories) } });
	}

	return (
		<div className="jumbotron jumbotron-fluid bg-transparent">
			<div className="container secondary-color">
				<h1 className="display-4">Food Recipes</h1>
				<p className="lead">
					A curated list of recipes for the best homemade meal and delicacies.
				</p>
				<div className="input-group search rounded-1 p-sm">
					<input type="search" class="form-control searchbox" placeholder="Find a recipe or ingredient..." aria-label="Search" aria-describedby="search-addon" />
					<button type="button" class="btn btn-primary rounded-2" data-mdb-ripple-init>search</button>
				</div>

				<hr className="my-4" />
				<h4 className="top-categories">
					Top Categories
				</h4>
				<section className="my-2 mb-8">
					<div className="row">
						{state.categories.map(cat => <Link to={`/categories/${dasherizeName(cat.name)}`} className="col-md-4">{cat.name}</Link>)}
					</div>
					<div className="text-center my-4">
						<Link
							to="/categories"
							className="text-center my-4"
							role="button"
						>
							More categories {">"}
						</Link>
					</div>
				</section>
			</div>
		</div>
	)
}

