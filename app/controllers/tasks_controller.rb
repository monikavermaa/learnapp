class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
    if @task.save
      notify_third_party(@task)  # Notify third-party API
      render json: { message: 'Task created successfully' }, status: :created
    else
      render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end

  def notify_third_party(task)
  # Define the third-party API endpoint URL
    third_party_url = 'https://api.example.com/webhook'

    # Prepare the payload with the relevant data
    payload = {
      title: task.title,
      description: task.description
      # You might include other relevant data fields
    }
  
    # Perform the HTTP POST request to the third-party API
    response = HTTParty.post(third_party_url, body: payload.to_json, headers: { 'Content-Type': 'application/json' })
  
    # Check the response status and handle errors if needed
    if response.success?
      Rails.logger.info('Webhook sent successfully!')
    else
      Rails.logger.error("Failed to send webhook: #{response.code}, #{response.body}")
    end
  end

end
