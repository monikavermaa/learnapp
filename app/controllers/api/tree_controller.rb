# app/controllers/api/tree_controller.rb
class Api::TreeController < ApplicationController
  before_action :set_tree

  # GET /api/tree
  def index
    render json: @tree.as_json(include: { nodes: { include: { children: {} } } })
  end

  # POST /api/tree
  def create
    @node = Node.new(node_params)
    @node.tree = @tree

    if @node.save
      render json: { message: 'Node created successfully' }, status: :created
    else
      render json: { errors: @node.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_tree
    @tree = Tree.first_or_create # Assuming there's only one tree
  end

  def node_params
    params.require(:node).permit(:label, :parent_id)
  end
end
