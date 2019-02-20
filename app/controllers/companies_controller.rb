class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show order]

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

  def order; end

  private

  def set_company
    @company = current_user.company
    authorize @company
  end

  def company_params
    params.require(:company).permit(:name, :cnpj, :photo)
  end
end
