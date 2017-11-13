import React from 'react';

const defaultState = {
  result: 0,
  num1: "",
  num2: ""
};

class Calculator extends React.Component{
  constructor(){
    super();
    this.state = defaultState;
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }

    setNum1(e) {
      const num1 = e.target.value ? parseInt(e.target.value) : "";
      this.setState({num1});
    }

    setNum2(e) {
      const num2 = e.target.value ? parseInt(e.target.value) : "";
      this.setState({num2});
    }

    add(e) {
      e.preventDefault();
      let result = this.state.num1 + this.state.num2;
      this.setState({result});
    }

    subtract(e) {
      e.preventDefault();
      let result = this.state.num1 - this.state.num2;
      this.setState({result});
    }

    multiply(e) {
      e.preventDefault();
      let result = this.state.num1 * this.state.num2;
      this.setState({result});
    }

    divide(e) {
      e.preventDefault();
      let result = this.state.num1 / this.state.num2;
      this.setState({result});
    }

    clear(e) {
      e.preventDefault();
      this.setState(defaultState);
    }

  render(){
    const { num1, num2, result } = this.state;
    return (
      <div>
        <h1>{result}</h1>

        <input onChange={this.setNum1} value={num1}/>
        <input onChange={this.setNum2} value={num2}/>
        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>/</button>
        <button onClick={this.clear}>clear</button>
      </div>

    );
  }
}

export default Calculator;
