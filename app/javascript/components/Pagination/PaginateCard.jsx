import React from "react";

export const PaginateCard = ({ currentPage, totalPages, onPageChange }) => {
	const handleNextPage = () => {
		if (currentPage < totalPages) {
			onPageChange(currentPage + 1);
		}
	};

	const handlePrevPage = () => {
		if (currentPage > 1) {
			onPageChange(currentPage - 1);
		}
	};

	return (
		<div className="d-flex justify-content-end">
			<div>
				<button
					onClick={handlePrevPage}
					className="btn btn-light btn-sm"
					disabled={currentPage === 1}
				>
					Previous
				</button>
				<button
					onClick={handleNextPage}
					className="btn btn-light btn-sm"
					disabled={currentPage === totalPages}
				>
					Next
				</button>
			</div>
			<span>
				Page {currentPage} of {totalPages}
			</span>
		</div>
	);
};
