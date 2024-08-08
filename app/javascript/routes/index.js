import React from "react";
import { createBrowserRouter } from "react-router-dom";

import Home from "../components/Home";
import App from "../components/App";

import { RecipeDetails, Recipes } from "../components/Recipe";
import { Categories } from "../components/Category";
import { ErrorPage } from "../components/Error";
import { SearchResults, searchLoader } from "../components/Search";

export const router = createBrowserRouter([
	{
		path: "/",
		element: <App />,
		errorElement: <ErrorPage />,
		children: [
			{
				path: "",
				element: <Home />
			},
			{
				path: "/recipes",
				element: <Recipes />,
			},
			{
				path: "/recipes/:id",
				element: <RecipeDetails />,
			},
			{
				path: "/categories",
				element: <Categories />,
			},
			{
				path: "/search",
				element: <SearchResults />,
				loader: searchLoader
			},
		]
	},
]);

