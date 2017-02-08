class Source < ApplicationRecord
  belongs_to :user
  attr_accessor :headline
end
