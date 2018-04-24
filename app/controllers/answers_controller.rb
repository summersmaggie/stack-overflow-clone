class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:notice] = "Answer saved!"
      redirect_to questions_path
    else
      flash[:alert] = "Sorry, couldn't save."
      render :new
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:answer_title, :answer_body)
    end

end
