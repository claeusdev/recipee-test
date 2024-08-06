import React, { useState, useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";


function reshapeRecipe(recipes) {
	return recipes.map(r => ({
		...r?.attributes
	}))
}

const Recipes = () => {
	const navigate = useNavigate();
	const [recipes, setRecipes] = useState([]);

	useEffect(() => {
		const url = "/api/v1/recipes";
		fetch(url)
			.then((res) => {
				if (res.ok) {
					return res.json();
				}
				throw new Error("Network response was not ok.");
			})
			.then((res) => setRecipes(reshapeRecipe(res.data)))
			.catch(() => navigate("/"));
	}, []);


	const noRecipe = (
		<div className="vw-100 vh-50 d-flex align-items-center justify-content-center">
			<h4>
				Loading ...
			</h4>
		</div>
	);


	const allRecipes = recipes.map((recipe, index) => {
		console.log({ recipe: recipe.image })
		return (
			<div key={recipe.title + index} className="col">
				<div className="card mb-4">
					<img
						src={recipe.image}
						className="card-img-top"
						alt={`${recipe.title} image`}
					/>
					<div className="card-body">
						<h5 className="card-title">{recipe.title}</h5>
					</div>
				</div>
			</div>
		)
	}
	);

	return (
		<>
			<section className="jumbotron jumbotron-fluid text-center">
				<div className="container py-5">
					<h1 className="display-4">Recipes for every occasion</h1>
					<p className="lead text-muted">
						We’ve pulled together our most popular recipes, our latest
						additions, and our editor’s picks, so there’s sure to be something
						tempting for you to try.
					</p>
				</div>
			</section>
			<div className="py-5">
				<main className="container">
					<div className="row row-cols-1 row-cols-md-3 g-4" data-masonry='{"percentPosition": true }'>
						{recipes.length > 0 ? allRecipes : noRecipe}
					</div>
				</main>
			</div>
		</>
	);
};

export default Recipes;

