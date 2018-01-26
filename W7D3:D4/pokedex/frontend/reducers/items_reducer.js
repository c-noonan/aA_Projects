import {RECEIVE_ALL_POKEMON, RECEIVE_POKEMON} from '../actions/pokemon_actions';
import _ from 'lodash';

const itemsReducer = (state = {}, action) => {
  let newState;
  switch(action.type) {
    case RECEIVE_POKEMON:
      return _.merge({}, state, action.items);
    default:
      return state;
  }
};

export default itemsReducer;
