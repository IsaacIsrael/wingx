class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show]

  def new
    @company = Company.new
    authorize @company
  end

  def create
    @company = Company.new(company_params)
    authorize @company
    @company.user = current_user

    if @company.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show; end

  # def edit
  #   @company = Company.find(params[:id])
  # end

  # def update
  #   @company.update(company_params)
  #   redirect_to @company
  # end

  # def destroy
  #   @company = Company.find(params[:id])
  #   @company.destroy
  #   redirect_to @companies
  # end

  private

  def set_company
    @company = Company.find(params[:id])
    authorize @company
  end

  def company_params
    params.require(:company).permit(:name, :cnpj, :photo)
  end
end
