import React from "react";
import { createRoot } from "react-dom/client";
import { RouterProvider } from "react-router-dom";
import { router } from "../routes";
import { RecipesProvider } from "../state";

document.addEventListener("turbo:load", () => {
	const root = createRoot(
		document.body.appendChild(document.createElement("div"))
	);
	root.render(
		<RecipesProvider>
			<RouterProvider router={router} />
		</RecipesProvider>
	);
}); 
