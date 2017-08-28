class Comment < ActiveRecord::Base
  include Humanizer
  require_human_on :create, unless: :bypass_humanizer

  belongs_to :article
end
