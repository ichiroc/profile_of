# frozen_string_literal: true

# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  name       :string
#  score      :float
#  magnitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Person < ApplicationRecord
  has_many :sources, dependent: :destroy
  validates :name, presence: true

  accepts_nested_attributes_for :sources

  def twitter
    sources.find_by provider: :twitter
  end

  def github
    sources.find_by provider: :github
  end

  def blog
    sources.find_by provider: :blog
  end

  def analyze_overview!
    body = sources.map { |source| source.texts.map(&:body) }.flatten.join("\n")
    res = Nlp.sentiments(Sanitize.clean(body), 'PLAIN_TEXT')
    self.score = res['documentSentiment']['score']
    self.magnitude = res['documentSentiment']['magnitude']
    save!
  end

  def entities(type)
    Entity.where(entity_type: type)
      .joins(text: { source: :person })
      .where('person_id = ?', self.id)
      .order(salience: :desc)
  end
end
