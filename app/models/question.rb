class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true

  acts_as_commentable
  acts_as_votable
  
  validate :content, presence: true
end
