require 'rails_helper'

RSpec.describe 'articles/index', type: :view do
  before(:each) do
    assign(:articles, [
             Article.create!(
               title: 'Title',
               content: 'Content'
             ),
             Article.create!(
               title: 'Title',
               content: 'Content'
             )
           ])
  end

  it 'renders a list of articles' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Content'.to_s), count: 2
  end
end