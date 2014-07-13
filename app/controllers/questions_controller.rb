class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_url, flash: { success: 'You just created a new question.'}
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:content, :user_id)
  end
end
