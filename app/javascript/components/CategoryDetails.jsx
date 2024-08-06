import React from "react"
import { useLoaderData } from "react-router";

import { sendRequest } from "../api";
import { dasherizeName } from "../utils";
import Recipe from "./Recipe";

export async function categoryLoader({ params }) {
	const { attributes } = await sendRequest(`categories/${dasherizeName(params.name)}`)
	return { category: attributes };
}

const CategoryDetails = () => {
	const { category } = useLoaderData();
	console.log({ category })

	return <section className="container">

		<h1>
			{category.name}
		</h1>
		<hr />

		<div className="row">
			{category.recipes.map(recipe => <Recipe recipe={recipe} />)}
		</div>

	</section>
}

export default CategoryDetails
