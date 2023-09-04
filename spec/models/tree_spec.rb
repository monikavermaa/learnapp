require 'rails_helper'

RSpec.describe Tree, type: :model do
  it 'has many nodes' do
    tree = Tree.create
    node1 = Node.create(label: 'Node 1', tree: tree)
    node2 = Node.create(label: 'Node 2', tree: tree)

    expect(tree.nodes).to include(node1, node2)
  end

  it 'destroys associated nodes when destroyed' do
    tree = Tree.create
    node1 = Node.create(label: 'Node 1', tree: tree)
    node2 = Node.create(label: 'Node 2', tree: tree)

    expect { tree.destroy }.to change { Node.count }.by(-2)
  end
end
