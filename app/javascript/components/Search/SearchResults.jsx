import React, { useEffect, useCallback } from "react"
import { useNavigate, useLoaderData } from "react-router";
import { sendRequest } from "../../api";
import { buildSearchUrl, formatResponseData } from "../../utils";
import { RecipeCard } from "../Recipe";
import { PaginateCard } from "../Pagination";


export async function searchLoader({ request }) {
	const url = new URL(request.url);
	const q = url.searchParams.get("q") || "";
	const filter = url.searchParams.get("filter") || "";
	const category = url.searchParams.get("category") || "";
	const page = url.searchParams.get("page") || 1;
	const results = await sendRequest(`search?q=${q}&filter=${filter}&category=${category}&page=${page}`);
	return { results: formatResponseData(results.data), q, page, meta: results.meta, filter, category };
}

export const SearchResults = () => {
	const { results, q, meta, filter, category, page } = useLoaderData();
	const navigate = useNavigate();

	const handlePageChange = useCallback(
		(newPage) => {
			const url = buildSearchUrl(q, newPage, filter, category);
			navigate(url);
		},
		[q, filter, category, navigate]
	);

	useEffect(() => {
		const url = buildSearchUrl(q, page, filter, category);
		navigate(url, { replace: true });
	}, [q, filter, category, page, navigate]);

	return (
		<section className="container">
			{q &&
				<>
					<h1>Search Results for {q}</h1>
					<hr />
				</>
			}

			{(filter || category) && <p className="lead">
				filtering by: {filter} {category}
			</p>}

			{results.map(recipe => <RecipeCard recipe={recipe} key={recipe.title} />)}

			<PaginateCard
				currentPage={Number(page)}
				totalPages={meta.last}
				onPageChange={handlePageChange}
			/>
		</section>
	)
}

