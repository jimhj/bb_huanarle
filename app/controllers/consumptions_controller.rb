# coding: utf-8
class ConsumptionsController < ApplicationController
  respond_to :html, :json

  def create
    @consumption = Consumption.create(date: params[:date], desc: params[:desc], cost: params[:cost])
    respond_with(@consumption)
  end

end