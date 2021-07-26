require 'rails_helper'

RSpec.describe User, :type :model do
    model = User.create
    expect(model).to be_valid

end