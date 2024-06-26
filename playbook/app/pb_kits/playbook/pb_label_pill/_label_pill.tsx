import React from 'react'
import classnames from 'classnames'
import { globalProps } from '../utilities/globalProps'

import { buildAriaProps, buildDataProps, buildHtmlProps } from '../utilities/props'

import Pill from '../pb_pill/_pill'
import Caption from '../pb_caption/_caption'

type LabelPillProps = {
  aria?: {[key: string]:string},
  className?: string,
  data?: {[key: string]:string},
  htmlOptions?: {[key: string]: string | number | boolean | (() => void)},
  id?: string,
  label?: string,
  pillValue?: string,
  variant: "error" | "info" | "neutral" | "primary" | "success" | "warning",
}

const LabelPill = (props: LabelPillProps) => {
  const {
    aria = {},
    className,
    data = {},
    htmlOptions = {},
    id,
    label,
    pillValue,
    variant = 'neutral',
  } = props
  const ariaProps = buildAriaProps(aria)
  const dataProps = buildDataProps(data)
  const htmlProps = buildHtmlProps(htmlOptions)
  const css = classnames(
    'pb_label_pill_kit',
    globalProps(props),
    className
  )

  return (
    <div
        {...ariaProps}
        {...dataProps}
        {...htmlProps}
        className={css}
        id={id}
    >
      <Caption
          className="pb_label_pill_label"
          text={label}
      />

      <Pill
          className="pb_label_pill_pill"
          text={pillValue}
          variant={variant}
      />
    </div>
  )
}

export default LabelPill
