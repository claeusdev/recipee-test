export const dasherizeName = (name) => {
	return name?.replaceAll(" ", "-")
}

export function formatResponseData(response) {
	return response.map(data => ({
		...data.attributes
	}))
}
