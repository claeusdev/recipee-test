import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { dasherizeName, formatResponseData } from "../../utils";
import { PaginateCard } from "../Pagination";
import { sendRequest } from "../../api";

export const Categories = () => {
	const [categories, setCategories] = useState([])
	const [meta, setMeta] = useState({})
	const [page, setPage] = useState(1)


	useEffect(() => {
		getCategories();
	}, [page]);

	async function getCategories() {
		const results = await sendRequest(`categories?page=${page}`);
		setCategories(formatResponseData(results.data))
		setMeta(results.meta)
	}

	return <div className="row" style={{
		minHeight: "50vh"
	}}>
		{categories.map(cat => <Link to={`/search?category=${dasherizeName(cat.name)}`} className="col-md-3">{cat.name}</Link>)}
		<PaginateCard
			currentPage={Number(page)}
			totalPages={meta.last}
			onPageChange={setPage} />

	</div>
}

