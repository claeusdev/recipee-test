const BASE_URL = "/api/v1";

const initializeApp = async () => {
	const response = await fetch(`${BASE_URL}/home`).then(res => {
		if (res.ok) {
			return res.json()
		}
		throw new Error("There was a problem getting recipes.");
	})

	return await response.data;
}

export const sendRequest = async (url) => {
	try {
		const response = await fetch(`${BASE_URL}/${url}`);
		const results = await response.json();
		return results;
	} catch {
		throw new Error("There was a problem completing the resuest.");
	}
}

const getRecipes = async () => {
	try {
		const response = await fetch(`${BASE_URL}/recipes`);
		const recipies = await response.json();
		return recipies;
	} catch {
		throw new Error("There was a problem getting recipes.");
	}
}

const getCategories = async () => {
	const response = await fetch(`${BASE_URL}/categories`).then(res => {
		if (res.ok) {
			return res.json()
		}
		throw new Error("There was a problem getting recipes.");
	})

	return await response.data;
}

export {
	getRecipes,
	getCategories,
	initializeApp
}
