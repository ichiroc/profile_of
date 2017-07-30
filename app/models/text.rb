# frozen_string_literal: true
# == Schema Information
#
# Table name: texts
#
#  id         :integer          not null, primary key
#  body       :text
#  score      :float
#  magnitude  :float
#  source_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  text_type  :integer
#
# Indexes
#
#  index_texts_on_source_id  (source_id)
#
# Foreign Keys
#
#  fk_rails_...  (source_id => sources.id)
#

class Text < ApplicationRecord
  has_many :entities, dependent: :destroy
  belongs_to :source

  validates :body, presence: true
  validates :score, presence: true
  validates :magnitude, presence: true
  validates :text_type, presence: true

  before_validation :analyze_sentiment
  after_save :analyze_entities!

  enum text_type: [:plain_text, :html]

  # #default_value_for(:text_type){ :plain_text }

  def analyze_sentiment
    res = Nlp.sentiments(body, text_type)
    self.score = res['documentSentiment']['score']
    self.magnitude = res['documentSentiment']['magnitude']
  end

  def analyze_entities!
    Nlp.entities(body, text_type).each do |entity|
      entities.create! entity_type: entity['type'],
                       salience: entity['salience'],
                       name: entity['name']
    end
  end
end
