import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import CampaignIndexContainer from './components/CampaignIndexContainer'
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'
import { createBrowserHistory } from 'history'
import './styles/index.css'

var history = createBrowserHistory()

ReactDOM.render(
  <Router history={history}>
    <Switch>
      <Route exact path="/" component={App} />
      <Route path="/api/campaigns" component={CampaignIndexContainer} />
    </Switch>
  </Router>
  , document.getElementById('root'))
