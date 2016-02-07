FactoryGirl.define do
  factory :document do
    user
    name 'factory girl document'
    description 'a document generated by factory girl'
    public true
    document File.new(Rails.root.join('spec', 'documents', 'test_document.pdf'))
  end
end