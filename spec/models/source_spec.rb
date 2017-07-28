# == Schema Information
#
# Table name: sources
#
#  id         :integer          not null, primary key
#  provider   :string
#  token      :string
#  secret     :string
#  person_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_sources_on_person_id  (person_id)
#

require 'rails_helper'

RSpec.describe Source, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
