import {connect} from 'react-redux';
import {selectPokemonItem} from '../../reducers/selectors';
// import {requestPokemon} from '../../actions/pokemon_actions';
import ItemDetail from './item_detail';

const mapStateToProps = (state, ownProps) => {
  // console.log(ownProps);
  return {
    item: selectPokemonItem(state, ownProps.match.params.itemId)
  };
};

const mapDispatchToProps = () => {

};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(ItemDetail);
