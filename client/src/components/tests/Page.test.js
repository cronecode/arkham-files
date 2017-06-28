import React from 'react'
import { shallow } from 'enzyme'
import Page from '../Page'

describe('Page', () => {
  it('always renders a div', () => {
    const wrapper = shallow(<Page />)
    const divs = wrapper.find('div')

    expect(divs.length).toBeGreaterThanOrEqual(1)
  })
})