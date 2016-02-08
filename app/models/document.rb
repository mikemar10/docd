class Document < ActiveRecord::Base
  acts_as_taggable
  belongs_to :user
  validates :user, presence: true
  has_attached_file :document,
    styles: { thumb: ['218x256>', :png] }

  validates_attachment :document, presence: true,
    content_type: { content_type: /\A.*\/pdf\Z/i },
    size: { less_than: 50.megabytes }

  validates :name, length: { maximum: 255 }

  validates :description, length: { 
    maximum: 2000,
    tokenizer: lambda { |str| str.split(/\s+/) },
    too_long: "cannot have more than %{count} words"
  }
end
