# == Schema Information
#
# Table name: jwt_denylists
#
#  id         :uuid             not null, primary key
#  exp        :datetime
#  jti        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_jwt_denylists_on_jti  (jti)
#
require 'rails_helper'

RSpec.describe JwtDenylist, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
