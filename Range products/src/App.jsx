import React, { useState, useEffect } from 'react';
import './App.css';

const App = () => {
  const [products, setProducts] = useState([]);
  const [sortedProducts, setSortedProducts] = useState([]);
  const [sortKey, setSortKey] = useState(null);
  const [page, setPage] = useState(0);
  const [hasMore, setHasMore] = useState(true);

  const fetchProducts = async (reset = false) => {
    try {
      const response = await fetch(`http://localhost/product_api.php?page=${page}`); 
      const data = await response.json();
  
      if (data.product_arr.length === 0) {
        setHasMore(false);
        return;
      }
  
      const productList = data.product_arr.map(product => ({
        ...product,
        price: Number(product.price), 
        was_price: product.was_price ? Number(product.was_price) : null, 
        img: `/img/${product.img}`
      }));
  
      if (reset) {
        setProducts(productList);
        setSortedProducts(productList);
      } else {
        setProducts(prev => [...prev, ...productList]);
        setSortedProducts(prev => [...prev, ...productList]);
      }
    } catch (error) {
      console.error('Error fetching products:', error);
    }
  };
  

  useEffect(() => {
    fetchProducts(true);
  }, [page]);

  const handleSort = (key) => {
    setSortKey(key);
    const sorted = [...products].sort((a, b) => {
      if (key === 'price') {
        return a.price - b.price;
      } else if (key === 'reviews') {
        return (a.reviews || 0) - (b.reviews || 0);
      } else if (key === 'name') {
        return a.name.localeCompare(b.name);
      } else if (key === 'saving') {
        const savingA = a.was_price ? a.was_price - a.price : 0;
        const savingB = b.was_price ? b.was_price - b.price : 0;
        return savingA - savingB;
      }
      return 0;
    });
    setSortedProducts(sorted);
  };

  const loadMoreProducts = () => {
    if (hasMore) {
      setPage(prevPage => prevPage + 1);
    }
  };

  return (
    <div className="app">
      <h1>Office Essentials</h1>
      <div className="sorting-buttons">
        <button onClick={() => handleSort('price')}>Sort By Price</button>
        <button onClick={() => handleSort('reviews')}>Sort By Review</button>
        <button onClick={() => handleSort('name')}>Sort By Name</button>
        <button onClick={() => handleSort('saving')}>Sort By Saving</button>
      </div>
      <div className="product-grid">
        {sortedProducts.map((product, index) => (
          <div key={index} className="product-card">
            <img src={product.img} alt={product.name} />
            <div className="product-grid__content">
              <h2>{product.name}</h2>
              <p>£{product.price.toFixed(2)}</p>
              {product.was_price && <p className="was-price">Was £{product.was_price.toFixed(2)}</p>}
              {product.reviews && <p className="review-score">{product.reviews}% Review Score</p>}
              <button>Add to Basket</button>
            </div>
          </div>
        ))}
      </div>
      {hasMore && (
        <button className="load-more" onClick={loadMoreProducts}>
          Load More Products
        </button>
      )}
    </div>
  );
};

export default App;
