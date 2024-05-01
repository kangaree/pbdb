import React, { useContext } from "react";
import classnames from "classnames";
import {
  buildAriaProps,
  buildCss,
  buildDataProps,
  buildHtmlProps,
} from "../../utilities/props";
import { globalProps, GlobalProps } from "../../utilities/globalProps";

import DropdownContext from "../context";

import Flex from "../../pb_flex/_flex";
import Body from "../../pb_body/_body";
import ListItem from "../../pb_list/_list_item";
import { GenericObject } from "../../types";

type DropdownOptionProps = {
  aria?: { [key: string]: string };
  children?: React.ReactChild[] | React.ReactChild;
  className?: string;
  dark?: boolean;
  data?: { [key: string]: string };
  htmlOptions?: { [key: string]: string | number | boolean | (() => void) };
  id?: string;
  key?: string;
  option?: GenericObject;
  padding?: string;
}  & GlobalProps;

const DropdownOption = (props: DropdownOptionProps) => {
  const {
    aria = {},
    children,
    className,
    dark = false,
    data = {},
    htmlOptions = {},
    id,
    key,
    option,
    padding = "xs",
  } = props;

  const {
    filteredOptions,
    filterItem,
    focusedOptionIndex,
    handleOptionClick,
    selected,
  } = useContext(DropdownContext);

  const isItemMatchingFilter = (option: GenericObject) =>
    option?.label.toLowerCase().includes(filterItem.toLowerCase());

  if (!isItemMatchingFilter(option)) {
    return null;
  }
  const isFocused =
    focusedOptionIndex >= 0 &&
    filteredOptions[focusedOptionIndex].label === option.label;
  const focusedClass = isFocused && "focused";

  const selectedClass = `${
    selected.label === option.label
      ? "selected"
      : "list"
  }`;
  const ariaProps = buildAriaProps(aria);
  const dataProps = buildDataProps(data);
  const htmlProps = buildHtmlProps(htmlOptions);
  const classes = classnames(
    buildCss(
      "pb_dropdown_option",
      selectedClass,
      focusedClass,
    ),
    globalProps(props, {padding}),
    className
  );

  return (
    <div
        {...ariaProps}
        {...dataProps}
        {...htmlProps}
        className={classes}
        id={id}
        key={key}
        onClick= {() => handleOptionClick(option)}
    >
      <ListItem
          cursor="pointer"
          dark={dark}
          data-name={option.value}
          key={option.label}
          padding="none"
      >
        <Flex
            align="center"
            className="dropdown_option_wrapper"
            justify="between"
            paddingX="sm"
            paddingY="xxs"
        >
          {children ? 
              children : 
              <Body dark={dark} 
                  text={option.label} 
              />
          }
        </Flex>
      </ListItem>
    </div>
  );
};

export default DropdownOption;
