import React from "react";
import { Link } from "react-router-dom";
import { dasherizeName } from "../../utils";

export const RecipeCard = ({ recipe }) => {
	return (
		<Link to={
			`/recipes/${dasherizeName(recipe.title.toLowerCase())}`
		} state={{ recipe }} className="col-md-6 recipe-card">
			<div className="card flex-row mb-2">
				<object
					className="card-img-left"
					type="image/png"
					data={recipe.image}
					alt={`${recipe.title} image`}
					aria-label="This image should exist, but alas it does not"
				>
					<img src="https://assets.afcdn.com/recipe/20150901/17089_w420h344c1cx1500cy2250.jpg" alt="Fallback image" width="150" height={160} />
				</object>
				<div className="card-body">
					<h5 className="card-title">{recipe.title}</h5>
					<p className="lead">
						{recipe.short_desc} ...
					</p>
					<div className="row">
						<span className="col-sm-4">
							<i className="bi bi-alarm"></i> {recipe.cook_time} minutes
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

