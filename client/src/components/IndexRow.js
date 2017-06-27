import React from 'react'
import { Link } from 'react-router-dom'

const IndexRow = (props) => {
  return (
    <div className="row text-left">
      <div className="col-xs-7">
        <Link className='space-below' to={'/api/campaigns/' + props.id}>{props.name}</Link>
      </div>
      <div className="col-xs-3">
      </div>
    </div>
  )
}

export default IndexRow