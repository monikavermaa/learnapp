require 'rails_helper'

RSpec.describe Node, type: :model do
  it 'validates the presence of the label' do
    node = Node.new(label: '')
    expect(node).not_to be_valid
    expect(node.errors[:label]).to include("can't be blank")
  end

  it 'belongs to a tree' do
    tree = Tree.create
    node = Node.new(label: 'Test Label', tree: tree)
    expect(node.tree).to eq(tree)
  end

  it 'belongs to a parent node' do
    parent_node = Node.create(label: 'Parent Node')
    child_node = Node.new(label: 'Child Node', parent: parent_node)
    expect(child_node.parent).to eq(parent_node)
  end

  it 'has many children nodes' do
    tree = Tree.create
    parent_node = Node.create(label: 'Parent Node', tree: tree)
    child1 = Node.create(label: 'Child 1', parent: parent_node, tree: parent_node.tree)
    child2 = Node.create(label: 'Child 2', parent: parent_node, tree: parent_node.tree)
    expect(parent_node.children).to include(child1, child2)
  end
end
