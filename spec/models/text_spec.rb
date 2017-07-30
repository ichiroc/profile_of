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

require 'rails_helper'

RSpec.describe Text, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
