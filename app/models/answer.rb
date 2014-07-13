class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validate :content, presence: true

  acts_as_commentable
  acts_as_votable
end
