document.addEventListener('DOMContentLoaded', () => {
    const form = document.querySelector('#filters form');
    const productList = document.getElementById('product-list');
    const pagination = document.getElementById('pagination');
    const filterToggle = document.querySelector('.filter-toggle');
    const aside = document.querySelector('aside');

    // Add event listener for the filter toggle button
    filterToggle.addEventListener('click', () => {
        aside.classList.toggle('filters-open');
        aside.classList.toggle('filters-closed');
        filterToggle.classList.toggle('open'); 

        if (filterToggle.classList.contains('open')) {
            filterToggle.textContent = '✖'; 
        } else {
            filterToggle.textContent = 'Filters'; 
        }

    });

    // Function to close the filter overlay and show the toggle button again
    function closeFilterOverlay() {
        if (window.innerWidth <= 768) {
            aside.classList.add('filters-closed');
            aside.classList.remove('filters-open');
            filterToggle.classList.remove('open'); 
            filterToggle.textContent = 'Filters'; 
        }
    }

    form.addEventListener('submit', (e) => {
        e.preventDefault();
        fetchProducts();
        closeFilterOverlay(); 
    });

    function fetchProducts(page = 1) {
        const formData = new FormData(form);
        const params = new URLSearchParams(formData);
        params.append('page', page);

        fetch(`products.php?${params.toString()}`)
            .then(response => response.json())
            .then(data => {
                displayProducts(data.products);
                displayPagination(data.total_products, data.current_page, data.products_per_page);
            });
    }

    function displayProducts(products) {
        productList.innerHTML = '';
        products.forEach(product => {
            const productDiv = document.createElement('div');
            productDiv.className = 'product';
            productDiv.innerHTML = `
                <img src="${product.image_url}" alt="${product.name}">
                <div class="des">
                   <span>${product.category}</span>
                   <h5>${product.name}</h5>
                   <p>${product.description}</p>
                   <h4>$${product.price}</h4>
                   <p class="sale_status">${product.sale_status}</p>
                </div>
            `;
            productList.appendChild(productDiv);
        });
    }

    function displayPagination(totalProducts, currentPage, productsPerPage) {
        pagination.innerHTML = '';
        const totalPages = Math.ceil(totalProducts / productsPerPage);

        if (currentPage > 1) {
            const prevButton = document.createElement('button');
            prevButton.textContent = 'Previous';
            prevButton.addEventListener('click', () => fetchProducts(currentPage - 1));
            pagination.appendChild(prevButton);
        }

        for (let i = 1; i <= totalPages; i++) {
            const pageButton = document.createElement('button');
            pageButton.textContent = i;
            if (i === currentPage) {
                pageButton.disabled = true;
            } else {
                pageButton.addEventListener('click', () => fetchProducts(i));
            }
            pagination.appendChild(pageButton);
        }

        if (currentPage < totalPages) {
            const nextButton = document.createElement('button');
            nextButton.textContent = 'Next';
            nextButton.addEventListener('click', () => fetchProducts(currentPage + 1));
            pagination.appendChild(nextButton);
        }
    }

    fetchProducts();
});
