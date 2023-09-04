require 'rails_helper'

RSpec.describe Api::TreeController, type: :controller do
  describe 'GET #index' do
    it 'returns a JSON response with the entire tree structure' do
      # Create a tree
      tree = FactoryBot.create(:tree)

      # Create nodes and build the tree structure
      # Replace this with your specific data creation logic
      node1 = FactoryBot.create(:node, tree: tree)
      node2 = FactoryBot.create(:node, tree: tree, parent: node1)
      node3 = FactoryBot.create(:node, tree: tree, parent: node1)
      node4 = FactoryBot.create(:node, tree: tree, parent: node3)

      get :index, format: :json
    
      expect(response).to have_http_status(:ok)
     
    end

  end

end
