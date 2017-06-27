import React from 'react'
import CampaignRow from './CampaignRow'

const CampaignIndex = (props) => {
  var list = []
  props.campaigns.forEach((campaign) => {
    list.push(<CampaignRow name={campaign.name} />)
  })
  return (
    <div>
      {list}
    </div>
  )
}

export default CampaignIndex