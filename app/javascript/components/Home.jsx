import React, { useEffect, useRef } from "react";
import { useNavigate, Link } from "react-router-dom";
import { sendRequest } from "../api";

import { useRecipeContext } from "../state";
import { formatResponseData, dasherizeName } from "../utils";
import { SearchForm } from "./Search";


export default () => {
	const { state, dispatch } = useRecipeContext();
	const searchRef = useRef();
	const navigate = useNavigate();

	useEffect(() => {
		loadHomePage()
	}, [])

	async function loadHomePage() {
		const categories = await sendRequest("home");
		dispatch({ type: 'SET_CATEGORIES', payload: { categories: formatResponseData(categories) } });
	}

	function handleSearchSubmit(e) {
		e.preventDefault();
		navigate(`/search?q=${searchRef.current.value}`)
	}

	return (
		<div className="jumbotron jumbotron-fluid bg-transparent">
			<div className="container secondary-color">
				<h1 className="display-4">Food Recipes</h1>
				<p className="lead">
					A curated list of recipes for the best homemade meal and delicacies.
				</p>
				<SearchForm searchRef={searchRef} handleSearchSubmit={handleSearchSubmit} />
			</div>

			<hr className="my-4" />
			<h4 className="top-categories">
				Top Categories
			</h4>
			<section className="my-2 mb-8">
				<div className="row">
					{state.categories.map(cat => <Link to={`/search?category=${dasherizeName(cat.name)}`} className="col-md-4" key={cat.name}>{cat.name}</Link>)}
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

	)
}

