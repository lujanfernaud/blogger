class Comment < ActiveRecord::Base
  include Humanizer
  require_human_on :create

  belongs_to :article
end
