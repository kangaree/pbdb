import React from 'react'
import Card from '../_card'

const CardLight = (props) => {
  return (
    <div>
      <Card {...props}>{'Card content'}</Card>
    </div>
  )
}

export default CardLight
