class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
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

  def show
    @candidate = Candidate.find_by(id: params[:id])
  end

  def edit
    @candidate = Candidate.find_by(id: params[:id])
  end

  def vote
    @candidate = Candidate.find_by(id: params[:id])
    @candidate.increment(:votes)
    @candidate.save

    redirect_to '/candidates'
  end

  def update
    @candidate = Candidate.find_by(id: params[:id])
    if @candidate.update(clean_params)
      flash[:notice] = "新增成功"
      render :show
    else
      flash[:notice] = "新增失敗"
      render :show
    end
  end

  def destroy
    @candidate = Candidate.find_by(id: params[:id])
    if @candidate.destroy
      redirect_to '/candidates'
      flash[:notice] = "刪除成功"
      else
      end
  end

  private
  def clean_params
    params.require(:candidate).permit(:name, :age, :party, :politics)
  end


end
