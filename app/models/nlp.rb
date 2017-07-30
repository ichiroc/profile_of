# frozen_string_literal: true

class Nlp < ActiveRecord::Base
  class << self
    def sentiments(body, type)
      res = post('/v1beta2/documents:analyzeSentiment', body, type)
      JSON.parse(res.body)
    end

    def entities(body, type)
      res = post('/v1beta2/documents:analyzeEntities', body, type)
      JSON.parse(res.body)['entities']
    end

    private

    def post(method, body, type)
      apikey = secrets.google[:key]
      headers = { 'Content-Type' => 'application/json' }
      client.post("#{method}?key=#{apikey}",
                  {
                    document: {
                      type: type.upcase,
                      language: 'ja',
                      content: body
                    },
                    encodingType: 'UTF8'
                  }.to_json,
                  headers)
    end
    def secrets
      Rails.application.secrets
    end

    def client
      Faraday.new 'https://language.googleapis.com/'
    end
  end
end
