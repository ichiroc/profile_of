# == Schema Information
#
# Table name: entities
#
#  id          :integer          not null, primary key
#  entity_type :string
#  salience    :float
#  name        :string
#  text_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_entities_on_text_id  (text_id)
#
# Foreign Keys
#
#  fk_rails_...  (text_id => texts.id)
#

class Entity < ApplicationRecord
  belongs_to :text
  validates :entity_type, presence: true
  validates :name, presence: true
  validates :salience, presence: true

  scope :sorted, -> { order(salience: :desc) }
  scope :typed, ->(typed) { where(entity_type: typed).sorted }
end
