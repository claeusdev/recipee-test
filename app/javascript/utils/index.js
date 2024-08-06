export const dasherizeName = (name) => {
	return name?.replaceAll(" ", "-")
}

export function getResponseData(response) {
	return response.map(data => ({
		...data.attributes
	}))
}
