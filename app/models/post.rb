# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  text       :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#  status     :string(255)
#

class Post < ActiveRecord::Base

  # State
  include AASM
  aasm_column :status
  aasm_initial_state :unpublished
  aasm_state :unpublished
  aasm_state :published
  aasm_state :published_privately
  
  aasm_event :publish do
    transitions :to  => :published, :from => [:unpublished, :published_privately]
  end
  
  aasm_event :publish_privately do
    transitions :to => :published_privately, :from => [:unpublished, :published]
  end
  
  aasm_event :unpublish do
    transitions :to => :unpublished, :from => [:published, :published_privately] 
  end
  
  # Validations
  validates_presence_of :title, :if => Proc.new { |post| !post.unpublished? }
  validates_presence_of :text, :if => Proc.new { |post| !post.unpublished? }
end
