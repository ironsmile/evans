require 'spec_helper'

describe 'teachers/index.html.haml' do
  before do
    assign :teachers, []
  end

  it 'displays the course name' do
    assign :course_name, 'Programming'
    render
    rendered.should have_content 'Programming'
  end

  it 'displays the course email' do
    assign :course_email, 'email@example.com'
    render
    rendered.should have_content 'email@example.com'
  end
end
