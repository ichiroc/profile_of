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
#
# Indexes
#
#  index_texts_on_source_id  (source_id)
#

require 'rails_helper'

RSpec.describe Text, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
