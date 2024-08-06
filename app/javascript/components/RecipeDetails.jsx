import React from "react";
import { useLocation } from "react-router";

const RecipeDetails = () => {
	const location = useLocation();
	const { recipe } = location.state || {};

	return <section className="container my-4">
		<div className="row">
			<div className="col-md-6">
				<img src={recipe.image} />
			</div>
			<div className="col-md-6">
				<h1>{recipe.title}</h1>
				<div className="row">
					<p>Prep time: {recipe.prep_time}</p>
					<p>Cook time: {recipe.prep_time}</p>
					<p>Total time: {recipe.total_time}</p>
				</div>

				<hr />
				<h3>Ingredients</h3>
				<ul>
					{recipe.ingredients.map(ingredient => <li>{ingredient.description}</li>)}
				</ul>
			</div>
		</div>
	</section>
}

export default RecipeDetails
