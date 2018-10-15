import React, { Component } from 'react'
import logo from './saga-genesis--logo.svg'

export const App = class extends Component {
  render() {
    return (
      <div className="app">
        <div className="main">

          <header>
            <img src={logo} className="logo" alt="logo" />

            <p>
             Hello
            </p>
          </header>

        </div>
      </div>
    )
  }
}
