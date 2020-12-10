import React from 'react'
import Timestamp from '../_timestamp.jsx'

const TimestampTimezonesAlign = (props) => {
  return (
    <div>
      <Timestamp
          align="left"
          showDate="false"
          showTimezone="true"
          timestamp={new Date().getTime()}
          timezone="America/New_York"
          {...props}
      />

      <br />

      <Timestamp
          align="left"
          showDate="true"
          showTimezone="true"
          timestamp={new Date().getTime()}
          timezone="America/New_York"
          {...props}
      />

      <br />

      <Timestamp
          align="left"
          showDate="true"
          showTimezone="true"
          timestamp={new Date((new Date()).getFullYear() + 4, (new Date().getMonth()), (new Date().getDate() + 1)).getTime()}
          timezone="America/New_York"
          {...props}
      />

      <br />

      <Timestamp
          align="left"
          showDate="false"
          showTimezone="true"
          timestamp={new Date().getTime()}
          timezone="Asia/Hong_Kong"
          {...props}
      />

      <br />

      <Timestamp
          align="left"
          showDate="true"
          showTimezone="true"
          timestamp={new Date().getTime()}
          timezone="Asia/Hong_Kong"
          {...props}
      />

      <br />

      <Timestamp
          align="left"
          showDate="true"
          showTimezone="true"
          timestamp={new Date((new Date()).getFullYear() + 4, (new Date().getMonth()), (new Date().getDate() + 1)).getTime()}
          timezone="Asia/Hong_Kong"
          {...props}
      />

      <br />
      <br />

      <Timestamp
          align="center"
          showDate="false"
          showTimezone="true"
          timestamp={new Date().getTime()}
          timezone="America/New_York"
          {...props}
      />

      <br />

      <Timestamp
          align="center"
          showDate="true"
          showTimezone="true"
          timestamp={new Date().getTime()}
          timezone="America/New_York"
          {...props}
      />

      <br />

      <Timestamp
          align="center"
          showDate="true"
          showTimezone="true"
          timestamp={new Date((new Date()).getFullYear() + 4, (new Date().getMonth()), (new Date().getDate() + 1)).getTime()}
          timezone="America/New_York"
          {...props}
      />

      <br />

      <Timestamp
          align="center"
          showDate="false"
          showTimezone="true"
          timestamp={new Date().getTime()}
          timezone="Asia/Hong_Kong"
          {...props}
      />

      <br />

      <Timestamp
          align="center"
          showDate="true"
          showTimezone="true"
          timestamp={new Date().getTime()}
          timezone="Asia/Hong_Kong"
          {...props}
      />

      <br />

      <Timestamp
          align="center"
          showDate="true"
          showTimezone="true"
          timestamp={new Date((new Date()).getFullYear() + 4, (new Date().getMonth()), (new Date().getDate() + 1)).getTime()}
          timezone="Asia/Hong_Kong"
          {...props}
      />

      <br />
      <br />

      <Timestamp
          align="right"
          showDate="false"
          showTimezone="true"
          timestamp={new Date().getTime()}
          timezone="America/New_York"
          {...props}
      />

      <br />

      <Timestamp
          align="right"
          showDate="true"
          showTimezone="true"
          timestamp={new Date().getTime()}
          timezone="America/New_York"
          {...props}
      />

      <br />

      <Timestamp
          align="right"
          showDate="true"
          showTimezone="true"
          timestamp={new Date((new Date()).getFullYear() + 4, (new Date().getMonth()), (new Date().getDate() + 1)).getTime()}
          timezone="America/New_York"
          {...props}
      />

      <br />

      <Timestamp
          align="right"
          showDate="false"
          showTimezone="true"
          timestamp={new Date().getTime()}
          timezone="Asia/Hong_Kong"
          {...props}
      />

      <br />

      <Timestamp
          align="right"
          showDate="true"
          showTimezone="true"
          timestamp={new Date().getTime()}
          timezone="Asia/Hong_Kong"
          {...props}
      />

      <br />

      <Timestamp
          align="right"
          showDate="true"
          showTimezone="true"
          timestamp={new Date((new Date()).getFullYear() + 4, (new Date().getMonth()), (new Date().getDate() + 1)).getTime()}
          timezone="Asia/Hong_Kong"
          {...props}
      />

    </div>
  )
}

export default TimestampTimezonesAlign