import React from "react";
import { createBrowserRouter } from "react-router-dom";

import Home from "../components/Home";
import RecipeDetails from "../components/RecipeDetails";
import ErrorPage from "../components/ErrorPage";
import Recipes from "../components/Recipes";
import CategoryDetails from "../components/CategoryDetails";
import Categories from "../components/Categories";
import { categoryLoader } from "../components/CategoryDetails";
import App from "../components/App";
import SearchResults, { searchLoader } from "../components/SearchResults";

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
			}, {
				path: "/categories/:name",
				element: <CategoryDetails />,
				loader: categoryLoader,
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

