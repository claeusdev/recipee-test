import React, { useEffect, useState } from "react";
import { useParams } from "react-router";
import { sendRequest } from "../../api";

export const RecipeDetails = () => {
	const { id } = useParams();
	const [recipe, setRecipe] = useState(null);
	const [loading, setLoading] = useState(false);

	useEffect(() => {
		setLoading(true)
		getRecipe()
		setLoading(false)
	}, [id])


	async function getRecipe() {
		const recipe = await sendRequest(`recipes/${id}`)
		setRecipe(recipe.data.attributes)
	}
	{ loading && <p className="lead">Loading ...</p> }

	return recipe && <section className="container my-4">
		<h1>{recipe.title}</h1>
		<object
			type="image/png"
			data={recipe.image}
			alt={`${recipe.title} image`}
			aria-label="This image should exist, but alas it does not"
		>
			<img src="https://assets.afcdn.com/recipe/20150901/17089_w420h344c1cx1500cy2250.jpg" alt="Fallback image" />
		</object>
		<div className="d-flex my-4 justify-content-between">
			<p className="lead text-bold">Prep time: {recipe.prep_time === 0 ? "instant" : recipe.prep_time} mins</p>
			<p className="lead text-bold">Cook time: {recipe.cook_time === 0 ? "instant" : recipe.cook_time} mins</p>
			{recipe.total_time > 0 &&
				<p className="lead text-bold">Total time: {recipe.total_time}</p>}
		</div>

		<hr />
		<h3>Ingredients</h3>
		<ul>
			{recipe.ingredients.map(ingredient => <li key={ingredient.description}>{ingredient.description}</li>)}
		</ul>
	</section >

}

