import {RECEIVE_ALL_POKEMON, RECEIVE_POKEMON} from '../actions/pokemon_actions';
import _ from 'lodash';

const pokemonReducer = (state = {}, action) => {
  let newState;
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      newState = action.pokemon;
      return newState;
    case RECEIVE_POKEMON:
      //create newState that copy everything from the previous state:
      newState = _.merge({}, state);
      //modify the newState with new information from action.pokemon:
      newState[`${action.pokemon.id}`] = action.pokemon;
      return newState;
    default:
      return state;
  }
};

export default pokemonReducer;
