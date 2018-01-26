import React from 'react';
import PokemonDetailContainer from './pokemon_detail_container';
import { Link, Route } from 'react-router-dom';
import ItemDetailContainer from '../items/item_detail_container';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestPokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps(newProps) {
    if (this.props.match.params.pokemonId !== newProps.match.params.pokemonId) {
      this.props.requestPokemon(newProps.match.params.pokemonId);
    }
  }


  render() {
    if (this.props.pokemon.moves) {
      return (
        <div>
          <img className="poke-pic" src={`${this.props.pokemon.image_url}`}></img>
          <h3>{this.props.pokemon.name}</h3>
          <h3>Type: {this.props.pokemon.poke_type}</h3>
          <h3>Defense: {this.props.pokemon.defense}</h3>
          <h3>Moves: {this.props.pokemon.moves.map(move => (
            <span>{move} </span>
          ))}
          </h3>
          <h3>Items:
            <ul className="item-list">
              {this.props.items.map(item => (
                <li>
                  <Link to={`/pokemon/${this.props.pokemon.id}/items/${item.id}`}>
                    <img width="50" src={`${item.image_url}`}></img>
                  </Link>
                </li>
            ))}
            </ul>
          </h3>
          <Route path='/pokemon/:pokemonId/items/:itemId' component={ItemDetailContainer}></Route>
        </div>
      );
    } else {
      return null;
    }
  }
}

export default PokemonDetail;
