import React from 'react'
import { Button, Filter, Flex, Select, TextInput } from '../../'

const FilterNoSort = (props) => {
  const options = [
    { value: 'USA' },
    { value: 'Canada' },
    { value: 'Brazil' },
    { value: 'Philippines' },
    { value: 'A galaxy far far away, like really far away...' },
  ]
  return (
    <Filter
        filters={{
          'Full Name': 'John Wick',
        }}
        minWidth="375px"
        results={546}
        sortValue={[{ name: 'popularity', dir: 'desc' }]}
        {...props}
    >
      <TextInput
          label="Full Name"
          placeholder="Enter name"
          {...props}
      />

      <Select
          blankSelection="Select One..."
          label="Territory"
          name="location"
          options={options}
          {...props}
      />
      <Flex
          spacing="between"
          {...props}
      >
        <Button
            text="Apply"
            {...props}
        />
        <Button
            text="Clear"
            variant="secondary"
            {...props}
        />
      </Flex>
    </Filter>
  )
}

export default FilterNoSort
