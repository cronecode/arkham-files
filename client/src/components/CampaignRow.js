import React, { Component } from 'react'

class CampaignRow extends Component {

  render() {
    return (
      <div>
        <span style={{ color: 'red' }}>
          {this.props.name}
        </span>
        <br />
      </div>
    )}
}

export default CampaignRow