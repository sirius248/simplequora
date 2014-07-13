class MainController < ApplicationController
  def index
    @questions = Question.limit(10)
  end

  def user_questions
    @questions = current_user.questions
  end

  def user_answers
    @answers = current_user.answers
  end

  def new_comment
    @question = Question.find(params[:question_id])
    @comment = @question.comments.create
    @comment.comment = params[:content]
    @comment.save

    redirect_to question_path(@question), flash: {success: 'New comment created.'}
  end

  def answer_comment
    @answer = Answer.find(params[:id])
    @comment = @answer.comments.create
    @comment.comment = params[:content]
    @comment.save

    redirect_to question_path(@answer.question), flash: {success: 'New comment created.'}
  end

  def up_vote
    resource = params[:data].constantize.find(params[:id])
    resource.liked_by current_user

    respond_to do |format| 
      format.json {
        render json: {
          id: resource.id,
          msg: 'up vote success',
          like: resource.get_likes.size,
          dislike: resource.get_dislikes.size
        }
      }
    end
  end

  def down_vote
    resource = params[:data].constantize.find(params[:id])
    resource.disliked_by current_user
    
    respond_to do |format| 
      format.json {
        render json: {
          id: resource.id,
          msg: 'down vote success',
          like: resource.get_likes.size,
          dislike: resource.get_dislikes.size
        }
      }
    end
  end
end
