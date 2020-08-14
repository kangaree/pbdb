/* @flow */
/* eslint-disable react/no-multi-comp, flowtype/space-before-type-colon */

import React from 'react'
import classnames from 'classnames'

import { Badge } from '../'
import { buildCss } from '../utilities/props'
import { globalProps } from '../utilities/globalProps.js'

type HashtagProps = {
  className?: string,
  data?: string,
  dark?: boolean,
  id?: string,
  text?: string,
  type: "default" | "home" | "project" | "appointment",
  url?: string,
}

const typeMap = {
  home: 'H#',
  project: 'P#',
  appointment: 'A#',
  default: '#',
}

const Hashtag = (props: HashtagProps) => {
  const { className, dark = false, text, type, url } = props
  return (
    <span
        className={classnames(
        className,
        buildCss('pb_hashtag_kit', { dark: dark }),
        globalProps(props)
      )}
    >
      <a href={url}>
        <Badge
            dark={dark}
            text={typeMap[type] + text}
            variant="primary"
        />
      </a>
    </span>
  )
}

export default Hashtag
