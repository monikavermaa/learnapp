# spec/factories/nodes.rb
FactoryBot.define do
  factory :node do
    label { 'Node Label' }
    association :tree, factory: :tree

    # If you want to create child nodes, you can use transient attributes
    transient do
      child_count { 0 } # Number of child nodes to create
    end

    after(:create) do |node, evaluator|
      create_list(:node, evaluator.child_count, parent: node, tree: node.tree)
    end
  end
end