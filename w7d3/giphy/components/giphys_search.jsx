import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      searchTerm: "",
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange() {
    return e => this.setState({searchTerm: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    let searchTerm = this.state.searchTerm.split(" ").join("+");
    this.props.fetchSearchGiphys(searchTerm);
  }

  render() {
    let {giphys} = this.props;

    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          <input onChange={this.handleChange()} type="text" value={this.state.searchTerm}/>
          <input type="submit" />
        </form>
        <GiphysIndex giphys={giphys}/>
      </div>
    );
  }
}

export default GiphysSearch
