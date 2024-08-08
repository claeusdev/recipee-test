export const dasherizeName = (name) => {
	return name?.replaceAll(" ", "-")
}

export function formatResponseData({ data }) {
	return data.map(val => ({
		...val.attributes
	}))
}

export const buildSearchUrl = (q, page, filter = "", category = "") => {
	const params = new URLSearchParams({ q, page });
	if (filter) params.append("filter", filter);
	if (category) params.append("category", category);
	return `/search?${params.toString()}`;
};
