import React from "react"

export const SearchForm = ({ handleSearchSubmit, searchRef }) => {
	return (
		<form role="search" onSubmit={handleSearchSubmit} id="search-form" className="input-group search rounded-1 p-sm">
			<input name="q" type="search" className="form-control searchbox" placeholder="Find a recipe or ingredient..." aria-label="Search" aria-describedby="search-addon" ref={searchRef} />
			<button type="submit" className="btn btn-primary rounded-2" data-mdb-ripple-init>search</button>
		</form>
	)
}
