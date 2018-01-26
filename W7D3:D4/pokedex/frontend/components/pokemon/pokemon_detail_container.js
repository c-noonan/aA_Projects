import {connect} from 'react-redux';
import {selectAllPokemon} from '../../reducers/selectors';
import {requestPokemon} from '../../actions/pokemon_actions';
import PokemonDetail from './pokemon_detail';

const mapStateToProps = (state, ownProps) => {
  const currentPokemon = state.entities.pokemon[`${ownProps.match.params.pokemonId}`];
  const itemArray = [];
  if (currentPokemon.item_ids) {
    currentPokemon.item_ids.forEach((itemId) => {
      itemArray.push(state.entities.items[`${itemId}`]);
    });
  }
  return {
    pokemon: currentPokemon,
    items: itemArray
  };
};

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
  requestPokemon: (id) => dispatch(requestPokemon(id))
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
