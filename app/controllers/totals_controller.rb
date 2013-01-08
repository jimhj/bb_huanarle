# coding: utf-8
class TotalsController < ApplicationController
  respond_to :html, :json

  def index
    @totals = Total.all
    respond_with(@totals)
  end

  def show
    # @consumptions = Total.find(params[:id])
    @consumptions = Consumption.find_all_by_total_id(params[:id])
    respond_with(@consumptions)
  end
end