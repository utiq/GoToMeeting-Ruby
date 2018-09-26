require 'httparty'
require 'json'

module GoToMeeting
  class Client

    include HTTParty
    include GoToMeeting::Attendees
    include GoToMeeting::Groups
    include GoToMeeting::Meetings
    include GoToMeeting::Organizers

    base_uri 'https://api.getgo.com/G2M/rest/'

    def initialize(*args)

      options = Utils.extract_options!(args)

      raise Utils.argument_error("access_token") unless options[:access_token]

      self.class.default_options[:headers] = {
        "Authorization" => "Bearer #{options[:access_token]}",
        "Content-Type" => "application/json;charset=UTF-8"
      }
    end
  end
end
