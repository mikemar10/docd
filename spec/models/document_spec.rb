require 'rails_helper'

RSpec.describe Document, type: :model do
  it 'belongs to a valid user' do
    document = build(:document)

    expect(document.user).to be_valid
  end

  it 'has a public boolean set' do
    document = build(:document)

    expect(document.public).not_to be nil
  end

  it 'has a name that does not exceed 255 characters' do
    document = build(:document)
    name = document.name

    expect(name).to satisfy { |name| name.length <= 255 }
  end

  it 'has a description that does not exceed 2000 words' do
    document = build(:document)
    words = document.description.split(/\s+/)
    
    expect(words).to satisfy { |words| words.length <= 2000 }
  end

  it 'has an attached document file' do
    document = build(:document)
    attached_document = document.document

    expect(attached_document).to satisfy { |doc| doc.instance_of? Paperclip::Attachment }
  end
end
