class QuestionsController < ApplicationController

    def index
      @questions = Question.all
      @new = Question.new
    end

    def create
      @question = Question.create(title: params[:question][:title],
                                  content: params[:question][:content])
      redirect_to root_path
    end

    def destroy
      @question = Question.find(params[:id])
      @question.destroy
      redirect_to root_path
    end

    def edit
      @question=Question.find(params[:id])
    end

    def update
      @question=Question.find(params[:id])
      @question.title = params[:question][:title]
      @question.content = params[:question][:content]
      @question.save
      redirect_to question_path
    end

    def show
      @question=Question.find(params[:id])
      @answer = Answer.new
      # @answer = Answer.where(question_id: params[:id]).first
    end

    def upvote
      @question=Question.find(params[:id])
      @question.votes+=1
      @question.save
      # render :json => @question
      respond_to do |format|
        format.js {render json: @question}
        format.html
      end

    end

    def downvote
      @question=Question.find(params[:id])
      @question.votes-=1
      @question.save
      # redirect_to questions_path
       respond_to do |format|
        format.js {render json: @question}
        format.html
      end
    end

end
