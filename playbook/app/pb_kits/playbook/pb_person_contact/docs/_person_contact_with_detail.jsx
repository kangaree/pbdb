import React from 'react'

import PersonContact from '../_person_contact'

const PersonContactWithDetail = (props) => {
  return (
    <div>
      <PersonContact
          contacts={[
          {
            contactType: 'email',
            contactValue: 'email@example.com',
          },
          {
            contactValue: '5555555555',
            contactDetail: 'Home',
          },
          {
            contactType: 'work',
            contactValue: '3245627482',
            contactDetail: 'Work',
          },
        ]}
          firstName="Harvey"
          lastName="Walters"
          {...props}
      />
    </div>
  )
}

export default PersonContactWithDetail
