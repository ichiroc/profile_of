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

require 'rails_helper'

RSpec.describe Entity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
