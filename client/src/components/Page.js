import React from 'react'
import Navbar from './Navbar'

const Page = (props) => {
  return (
    <div className="Page">
      <Navbar />
      {props.children}
    </div>
  )
}

export default Page