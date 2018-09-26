$:.unshift File.dirname(__FILE__)

require "go_to_meeting/version"
require "go_to_meeting/attendees"
require "go_to_meeting/groups"
require "go_to_meeting/meetings"
require "go_to_meeting/organizers"

module GoToMeeting

  class << self
    attr_accessor :access_token

    def new(params = {})
      @access_token = params.fetch(:access_token, '')
      GoToMeeting::Client.new(
        :access_token => @access_token
      )
    end

  end

end
