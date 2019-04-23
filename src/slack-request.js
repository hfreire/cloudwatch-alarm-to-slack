/*
 * Copyright (c) 2019, Hugo Freire <hugo@antifragile.systems>.
 *
 * This source code is licensed under the license found in the
 * LICENSE.md file in the root directory of this source tree.
 */

const _ = require('lodash')

const Request = require('request-on-steroids')

const defaultOptions = {
  perseverance: {
    retry: { max_tries: 3 }
  }
}

class SlackRequest extends Request {
  constructor (options = {}) {
    super(_.defaultsDeep({}, options, defaultOptions))
  }
}

module.exports = new SlackRequest()
