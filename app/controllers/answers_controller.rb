class AnswersController < ApplicationController

  def index
  end

  def create
    @question = Question.find(params[:question_id])
    @answer =  Answer.create(
                question_id: params[:question_id],
                title: params[:answer][:title],
                content: params[:answer][:content])
    redirect_to question_path(@question)
  end

  def new
    @answer = Answer.new
    @answers = Answer.where(question_id: params[:question_id])
  end

  def upvote
      @answer=Answer.find(params[:answer_id])
      @answer.votes+=1
      @answer.save
      redirect_to question_path(params[:question_id])
    end

    def downvote
      @answer=Answer.find(params[:answer_id])
      @answer.votes-=1
      @answer.save
      redirect_to question_path(params[:question_id])
    end

end
