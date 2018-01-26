import React from 'react';
import PokemonIndexContainer from './pokemon_index_container';
import PokemonDetailContainer from './pokemon_detail_container';
import PokemonIndexItem from './pokemon_index_item';
import { Route, withRouter } from 'react-router-dom';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount(){
    this.props.requestAllPokemon();
  }

  render() {
    // console.log(this.props);
    const pokemonItems = this.props.pokemon.map(
      (poke) => <PokemonIndexItem key={poke.id} pokemon={poke} />
    );
    return (
      <section >
        <ol className='pokemon-list'>
          {pokemonItems}
        </ol>
        <Route path='/pokemon/:pokemonId' component={PokemonDetailContainer} />
      </section>
    );
  }

}

export default PokemonIndex;
