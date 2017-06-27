import React, {Component} from 'react'
import CampaignIndex from './CampaignIndex'

class CampaignIndexContainer extends Component {
  constructor(props) {
    super(props)

    this.state = {campaigns: [] }
  }

  componentDidMount() {
    fetch('/api/campaigns')
      .then((response) => {
        return response.json() })
      .then((campaigns) => {
        this.setState({ campaigns })
        console.log(this.state)
      })
  }

  render() {
    return (
      <CampaignIndex campaigns={this.state.campaigns} />
    )
  }
}

const fetchCampaigns = () => {
  var campaigns = [
    {name: 'Foo'},
    {name: 'Bar'}
  ]

  return campaigns
}

export default CampaignIndexContainer