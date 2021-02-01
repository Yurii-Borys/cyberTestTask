require 'net/http'
require 'uri'
require 'json'
class SemestersController < ApplicationController
  def new
    @semester = Semester.new
  end
  def create
    @semester = Semester.create(semester_params)
    if @semester.errors.empty?
      redirect_to @semester
    else
      render 'new'
    end
  end
  def show
    @semester = Semester.find(params[:id])
    @login=@semester.name
    uri = URI('https://api.github.com/users/'+@login+'/repos')

    res = Net::HTTP.get_response(uri)

    jsonBody = JSON.parse(res.body, object_class: OpenStruct)
    username = jsonBody[0].owner.login

    repos = []

    jsonBody.each do | repo |
      repos.append(repo.name)
    end
    @name=username
    @reposit=repos.map{ |i|  %Q(#{i}) }.join(",  "  )
  end

  private
  def semester_params
    params.require(:semester).permit(:name)
  end
end
