class User < ApplicationRecord
  validates :firstname, presence: true
  require 'pg_search'
  include PgSearch::Model
  pg_search_scope :search, against: :country, using: {tsearch: {prefix: true}}
end
