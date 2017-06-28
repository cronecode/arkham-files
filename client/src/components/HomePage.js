import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import Page from './Page'
import daisy from '../images/daisy.jpg'

class HomePage extends Component {
  constructor(props) {
    super(props)
  }

  handleCampaignCreation() {

  }

  render() {
    return (
      <Page>
        <div className="row">
          <div className="col-xs-12 text-center centered-image">
            <img src={daisy} alt="Daisy Walker" className="text-center" />
          </div>
        </div>
        <div className="row">
          <div className="col-xs-12 col-sm-6 text-center">
            <Link to="/campaigns" className="btn btn-default btn-lg" />
          </div>
          <div className="col-xs-12 col-sm-6 text-center">
            <button className="btn btn-default btn-lg" onClick={this.handleCampaignCreation}></button>
          </div>
        </div>
      </Page>
    )
  }
}

export default HomePage