class Link < ApplicationRecord
  belongs_to :user

  def standardize_target_url!
    target_url.gsub!("http://", "")
    target_url.gsub!("https://", "")
  end
end
