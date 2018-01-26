import React from 'react';
import { Link } from 'react-router-dom';

 const PokemonIndexItem = (props) => (
   <li>
     <Link to={`/pokemon/${props.pokemon.id}`}>
       <img width="100" src={props.pokemon.image_url}></img>
       {props.pokemon.name}
     </Link>
   </li>
 );

 export default PokemonIndexItem;
