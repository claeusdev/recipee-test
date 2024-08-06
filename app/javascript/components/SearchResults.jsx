import React from "react"
import { sendRequest } from "../api";
import { useLoaderData } from "react-router";
import { formatResponseData } from "../utils";
import Recipe from "./Recipe";

export async function searchLoader({ request }) {
	const url = new URL(request.url);
	const q = url.searchParams.get("q");
	const results = await sendRequest(`search?q=${q}`);
	return { results: formatResponseData(results), q };
}
const SearchResults = () => {
	const { results, q } = useLoaderData();

	return (
		<section className="container">
			<h1>Search Results for {q}</h1>
			<hr />
			{results.map(recipe => <Recipe recipe={recipe} />)}
		</section>
	)
}

export default SearchResults
