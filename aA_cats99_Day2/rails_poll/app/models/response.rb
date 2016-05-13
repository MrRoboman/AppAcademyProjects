class Response < ActiveRecord::Base
  validates :user_id, :answer_choice_id, presence: true
  validate :not_duplicate_response
  validate :not_own_poll

  belongs_to(
    :respondent,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: "User"
  )

  belongs_to(
    :answer_choice,
    foreign_key: :answer_choice_id,
    primary_key: :id,
    class_name: "AnswerChoice"
  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )

  def sibling_responses
    question.responses.where.not(id: self.id)
  end

  private
  def not_duplicate_response
    if sibling_responses.exists?(user_id: self.respondent.id)
      errors[:duplicate_response] << "Can't answer a question again!"
    end
  end

  def not_own_poll
    if question.poll.author_id == respondent.id
      errors[:Cant] << "answer your own poll, fool!"
    end
  end
end
