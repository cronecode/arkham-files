import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import Campaigns from './Campaigns'
import CampaignIndexContainer from './components/CampaignIndexContainer'
import SpendXPForm from './PurchaseCardsForm'
import './index.css';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'
import { createBrowserHistory } from 'history'

var history = createBrowserHistory()

ReactDOM.render(
  <Router history={history}>
    <Switch>
      <Route exact path="/" component={App} />
      <Route path="/api/campaigns" component={CampaignIndexContainer} />
    </Switch>
  </Router>
  , document.getElementById('root'))
