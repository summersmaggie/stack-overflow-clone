class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def index
    @questions = Question.all
  end

  private
    def question_params
      params.require(:question).permit(:question_title, :question_body)
    end

end
