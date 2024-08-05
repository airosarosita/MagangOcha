class Admin::DashboardsController < ApplicationController
  before_action :set_admin_dashboard, only: %i[ show edit update destroy ]
end
