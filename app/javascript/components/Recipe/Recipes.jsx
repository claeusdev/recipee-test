import React, { useEffect } from "react";
import { RecipeCard } from ".";
import { getRecipes } from "../../api";
import { useRecipeContext } from "../../state";

export const Recipes = () => {
	const { state, dispatch } = useRecipeContext();

	useEffect(() => {
		fetchRecipes()
	}, []);

	async function fetchRecipes() {
		const recipeData = await getRecipes();

		dispatch({
			type: 'SET_RECIPIES', payload: {
				recipies: reshapeRecipe(recipeData)
			}
		})
	}

	const noRecipe = (
		<div className="vw-100 vh-50 d-flex align-items-center justify-content-center">
			<h4>
				Loading ...
			</h4>
		</div>
	);


	const allRecipes = state.recipes.map((recipe, index) =>
		<RecipeCard recipe={recipe} key={recipe.title + index} />
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
						{state.recipes.length > 0 ? allRecipes : noRecipe}
					</div>
				</main>
			</div>
		</>
	);
};
