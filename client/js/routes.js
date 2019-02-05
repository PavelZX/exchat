import React, { Component } from 'react'
import { Route, Switch } from 'react-router-dom'
import { Router } from 'react-router'

import history from './history'

import App from './containers/App'
import Channel from './components/channel/Channel'
import SignIn from './components/session/SignIn'

import Auth from './auth'

class Routes extends Component {

  render() {

    return (
    <Router history={history} >
<div id='content'>
      <Route path="/" component={App} onChange={::Auth.requireAuth}/>
      <Switch path="channels">
        <Route path="@:id" component={Channel} />
        <Route path=":id" component={Channel} />
      </Switch>
      <Route path="/login" component={SignIn} onChange={::Auth.rejectAuth}/>
</div>
    </Router>
    )
  }
}

export default (Routes)
