require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should respond_to :title }
  it { should respond_to :description }
end
