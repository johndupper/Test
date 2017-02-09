class Source < ApplicationRecord
  belongs_to :user
  # create non-persistent attribute
  attr_accessor :article
end
