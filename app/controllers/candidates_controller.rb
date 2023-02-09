class CandidatesController < ApplicationController
  def index

  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(clean_params)

    if @candidate.save
      flash[:notice] = "新增成功"
      redirect_to '/candidates'
    else
      render :new
    end
  end

  private
  def clean_params
    params.require(:candidate).permit(:name, :age, :party, :politics)
  end


end
