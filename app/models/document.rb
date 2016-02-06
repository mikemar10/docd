class Document < ActiveRecord::Base
  belongs_to :user
  has_attached_file :document
  validates_attachment :document, presence: true,
    content_type: { content_type: /\A.*\/pdf\Z/ },
    size: { less_than: 50.megabytes }
end
