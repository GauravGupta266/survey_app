class V1::SurveysController < ApplicationController

  before_action :set_survey, only: %i[update]

  # GET /v1/surveys
  def index
    surveys = Survey.all
    render json: surveys
  end

  # GET /v1/surveys
  def create
    survey = Survey.new(survey_params)
    survey.save!
    render json: { survey: survey, flash: { message: 'Survey created successfully!', type: 'success' } }
  end

  # PUT/PATCH /v1/surveys/:id
  def update
    @survey.update!(survey_params)
    render json: { survey: @survey, flash: { message: 'Survey updated successfully!', type: 'success' } }
  end

  private

  def set_survey
    @survey = Survey.find(params[:id])
  end

  def serializer
    V1::SurveySerializer
  end

  def survey_params
    params.require(:survey).permit(:name, :description)
  end


end