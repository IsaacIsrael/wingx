class CompaniesController < ApplicationController
  def new
    @company = Company.new
    authorize @company
  end

  def create
    @company = Company.new(company_params)
    @company.user = current_user
    authorize @company

    if @company.save
      redirect_to :new
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company.update(company_params)
    redirect_to @company
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to @companies
  end

  private

  def company_params
    params.require(:company).permit(:name, :cnpj, :photo)
  end
end
