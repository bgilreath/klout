require 'rubygems'
require 'json'
require 'httparty'

$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

class Kloutbg
  include HTTParty
  VERSION = '1.2.1'
  class << self

    @@base_host = "http://api.klout.com"
    @@api_version = "1"
    @@api_key = ""

    def initialize(api_key)
      @@api_key = api_key
    end

    def base_host=(host)
      @@base_host = host
    end

    def api_key=(api)
      @@api_key = api
    end

    def base_key
      @@base_host
    end

    def api_key
      @@api_key
    end

    #Score method: /klout
    def klout(username)
      #request_uri = "http://klout.com/api/twitter/1/klout/#{@@api_key}/#{username}.json"
      request_uri = "/#{@@api_version}/klout.json?key=#{@@api_key}&users=#{username}"
      self.class.get(@@base_host + request_uri)
    end

    #User method: /show
    def show(username)
      #http://api.klout.com/1/users/show.[xml_or_json]?key=[your_api_key]&users=[usernames]
      request_uri = "/#{@@api_version}/users/show.json?key=#{@@api_key}&users=#{username}"
      self.class.get(@@base_host + request_uri)
    end

    #User method: /topics
    def topics(username)
      #http://api.klout.com/1/users/topics.[xml_or_json]?key=[your_api_key]&users=[usernames]
      request_uri = "/#{@@api_version}/users/topics.json?key=#{@@api_key}&users=#{username}"
      self.class.get(@@base_host + request_uri)
    end

    #User method: /stats
    def stats(username)
      #http://api.klout.com/1/users/stats.[xml_or_json]?key=[your_api_key]&users=[usernames]
      request_uri = "/#{@@api_version}/users/stats.json?key=#{@@api_key}&users=#{username}"
      self.class.get(@@base_host + request_uri)
    end

    #User method: /history
    def history(username,measure,start_date,end_date)
      #http://api.klout.com/1/users/topics.[xml_or_json]?key=[your_api_key]&measure=[measure]&start_date=[start_date]&end_date=[end_date]&users=[usernames]
      request_uri = "/#{@@api_version}/users/history.json?key=#{@@api_key}&measure=#{measure}&start_date=#{start_date}&end_date=#{end_date}&users=#{username}"
      self.class.get(@@base_host + request_uri)
    end

    #Relationship method: /influenced_by
    def influenced_by(username)
      #http://api.klout.com/1/soi/influenced_by.[xml_or_json]?key=[your_api_key]&users=[usernames]
      request_uri = "/#{@@api_version}/soi/influenced_by.json?key=#{@@api_key}&users=#{username}"
      self.class.get(@@base_host + request_uri)
    end

    #Relationship method: /influencer_of
    def influencer_of(username)
      #http://api.klout.com/1/soi/influencer_of.[xml_or_json]?key=[your_api_key]&users=[usernames]
      request_uri = "/#{@@api_version}/soi/influencer_of.json?key=#{@@api_key}&users=#{username}"
      self.class.get(@@base_host + request_uri)
    end

    #Topic method: /search
    #Not supported here yet

    #Topic method: /verify
    #Not supported here yet

  end
end