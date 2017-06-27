import React from 'react'
import CampaignRow from './CampaignRow'

const CampaignIndex = (props) => {
  var list = []
  props.campaigns.forEach((campaign) => {
    list.push(<CampaignRow name={campaign.name} key={campaign.id} />)
  })
  return (
    <div>
      {list}
    </div>
  )
}

export default CampaignIndex