import React from 'react';

const ItemDetail = (props) => {
  // console.log(props);
  return (
    <div>
      <h3>{props.item.name}</h3>
      <h3>Price: {props.item.price}</h3>
      <h3>Happiness: {props.item.happiness}</h3>
    </div>
  );
};

export default ItemDetail;
