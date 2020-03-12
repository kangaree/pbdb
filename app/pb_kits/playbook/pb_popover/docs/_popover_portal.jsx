import React, { useState } from 'react'
import {
  Button,
  PbReactPopover,
} from '../..'

const PopoverPortal = () => {
  const [showPopover, setShowPopover] = useState(false)

  const handleTogglePopover = () => {
    setShowPopover(!showPopover)
  }

  const popoverReference = (
    <Button
        onClick={handleTogglePopover}
        text="Button Secondary"
        variant="secondary"
    />
  )

  return (
    <PbReactPopover
        placement="bottom"
        reference={popoverReference}
        show={showPopover}
        usePortal
    >
      {'Whoa. I\'m a portal popover.'}
    </PbReactPopover>
  )
}

export default PopoverPortal
