import React from "react"
import {Table} from "../../"

function TableDisableHover() {
  return (
    <Table disable_hover
        size="md"
    >
      <thead>
        <tr>
          <th>{`Column 1`}</th>
          <th>{`Column 2`}</th>
          <th>{`Column 3`}</th>
          <th>{`Column 4`}</th>
          <th>{`Column 5`}</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>{`Value 1`}</td>
          <td>{`Value 2`}</td>
          <td>{`Value 3`}</td>
          <td>{`Value 4`}</td>
          <td>{`Value 5`}</td>
        </tr>
        <tr>
          <td>{`Value 1`}</td>
          <td>{`Value 2`}</td>
          <td>{`Value 3`}</td>
          <td>{`Value 4`}</td>
          <td>{`Value 5`}</td>
        </tr>
        <tr>
          <td>{`Value 1`}</td>
          <td>{`Value 2`}</td>
          <td>{`Value 3`}</td>
          <td>{`Value 4`}</td>
          <td>{`Value 5`}</td>
        </tr>
      </tbody>
    </Table>
  )
}

export default TableDisableHover;
