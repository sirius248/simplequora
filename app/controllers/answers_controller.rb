class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = Answer.create(answer_params)
    @question = Question.find(params[:question_id])
    @question.answers << @answer

    redirect_to question_path(@question), flash: {success: 'You just answer the question.'}
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :user_id)
  end
end
