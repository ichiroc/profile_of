# frozen_string_literal: true
# == Schema Information
#
# Table name: sources
#
#  id         :integer          not null, primary key
#  provider   :string
#  person_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account    :string
#  score      :float
#  magnitude  :float
#
# Indexes
#
#  index_sources_on_person_id  (person_id)
#
# Foreign Keys
#
#  fk_rails_...  (person_id => people.id)
#

require 'rss'

class Source < ApplicationRecord
  has_many :texts, dependent: :destroy
  has_many :entities, through: :texts
  belongs_to :person

  validates :provider, presence: true
  validates :account, presence: true

  def fetch_texts!
    secrets = Rails.application.secrets
    if provider == 'twitter'
      twitter = Twitter::REST::Client.new do |config|
        config.consumer_key        = secrets.twitter[:token]
        config.consumer_secret     = secrets.twitter[:secret]
        config.access_token        = secrets.twitter[:access_token]
        config.access_token_secret = secrets.twitter[:access_secret]
      end
      twitter.user_timeline(account).each { |tweet| texts.create! body: tweet.text, text_type: :plain_text }
    elsif provider == 'github'
      Octokit.user_events(account, per_page: 100).each do |event|
        texts.create! body: event.payload.comment.body, text_type: :plain_text if event&.payload&.comment&.body
      end
    elsif provider == 'blog'
      feeds = Feedbag.find(account)
      rss = RSS::Parser.parse(feeds.first)
      rss.items.each do |item|
        content = item.title
        content += item.content_encoded if item.respond_to? :content_encoded
        content += item.content if item.respond_to? :content
        texts.create!(body: content, 'text_type' => :html)
      end
    end
    analyze_overview!
  end

  def analyze_overview!
    res = Nlp.sentiments(texts.map(&:body).join("\n"), texts.first.text_type)
    self.score = res['documentSentiment']['score']
    self.magnitude = res['documentSentiment']['magnitude']
    save!
  end
end
