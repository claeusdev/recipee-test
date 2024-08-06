import React from "react";
import { Link } from "react-router-dom";
import { useRecipeContext } from "../state";

const Categories = () => {
	const { state } = useRecipeContext();
	return <div className="row">
		{state.categories.map(cat => <Link to={`/categories/${cat.name}`} className="col-md-3">{cat.name}</Link>)}
	</div>
}

export default Categories
