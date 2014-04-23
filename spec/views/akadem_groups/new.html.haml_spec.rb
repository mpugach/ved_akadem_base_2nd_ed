require 'spec_helper'

describe "akadem_groups/new" do
  before { visit new_akadem_group_path }

  subject { page }

  let(:title)   { "Add New Akadem Group" }
  let(:h1)      { "Add Akadem Group" }
  let(:action)  { 'new' }

  it_behaves_like "akadem group new and edit"

  describe "Establishment date = Time#now by default" do
    let(:today) { Date.today }

    it { should have_selector('#akadem_group_establ_date_1i option[selected]', text: today.year) }
    it { should have_selector('#akadem_group_establ_date_2i option[selected]', text: Date::MONTHNAMES[today.mon]) }
    it { should have_selector('#akadem_group_establ_date_3i option[selected]', text: today.day) }
  end
end