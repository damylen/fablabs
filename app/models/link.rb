class Link < ActiveRecord::Base
  belongs_to :linkable, polymorphic: true
  # validates_presence_of :lab
  validates_presence_of :url
  validates_uniqueness_of :url, scope: [:linkable_id, :linkable_type]
  validates_format_of :url, with: URI::regexp(%w(http https))
end