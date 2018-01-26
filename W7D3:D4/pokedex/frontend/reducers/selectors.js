import _ from 'lodash';

export const selectAllPokemon = (state) => {
  return _.values(state.entities.pokemon);
};

export const selectPokemonItem = (state, itemId) => {
  // console.log(state.entities.items[`${itemId}`]);
  return state.entities.items[`${itemId}`];
};

// state only -> [{entities: {...}}]
// state.entities ->  [{pokemon: {...}}]
// state.entities.pokemon ->  [{},{},...]
