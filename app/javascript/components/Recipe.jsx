import React from "react";
import { Link } from "react-router-dom";

const Recipe = ({ recipe }) => {
	return (
		<Link to={
			`/recipes/${recipe.title}`
		} state={{ recipe }} className="col-md-6 recipe-card">
			<div className="card mb-4">
				<img
					src={recipe.image}
					className="card-img-top"
					alt={`${recipe.title} image`}
				/>
				<div className="card-body">
					<h5 className="card-title">{recipe.title}</h5>
					<div className="row">
						<span className="col-sm-4">
							<i className="bi bi-alarm"></i> {recipe.cook_time} minutes
						</span>
						<span className="col-sm-4">
							<i className="bi bi-person"></i> {recipe?.user?.username}
						</span>
						<span className="col-sm-4">
							<i className="bi bi-star"></i> {recipe.ratings}/5
						</span>
					</div>
				</div>
			</div>
		</Link>
	)
}

export default Recipe
