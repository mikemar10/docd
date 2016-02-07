require 'rails_helper'

RSpec.describe Document, type: :model do
  it 'is valid when created via the factory' do
    document = build(:document)
    expect(document).to be_valid
  end
end
