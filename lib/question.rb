require 'pry'
class Question < ActiveRecord::Base
  belongs_to(:survey)
  validates(:name, {:presence => true, :length => {:maximum => 150}})
  define_singleton_method(:survey_questions) do |id|
    all_questions = Question.all
    desired_questions = []
    all_questions.each() do |question|
      if question.survey_id == id
        desired_questions.push(question)
      end
    end
    desired_questions
  end

  define_singleton_method(:to_delete) do |ids|
    binding.pry
    ids.each() do |id|
      question = Question.find(id)
      question.delete
    end
  end

end
