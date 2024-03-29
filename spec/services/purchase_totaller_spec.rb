require 'rails_helper'

describe PurchaseTotaller do
  let!(:student1) { FactoryBot.create(:student, givenname: 'Stu 1') }
  let!(:student2) { FactoryBot.create(:student, givenname: 'Stu 2') }
  let!(:student3) { FactoryBot.create(:student, givenname: 'Stu 3') }


  before do
    stationary = FactoryBot.create(:consumable, category: :stationary, name: 'Pencil')
    chemical   = FactoryBot.create(:consumable, category: :chemical,   name: 'H2O')
    hardware   = FactoryBot.create(:consumable, category: :hardware,   name: 'Drill bit')
    wearable   = FactoryBot.create(:consumable, category: :wearable,   name: 'Gloves')
    disposable = FactoryBot.create(:consumable, category: :disposable, name: 'Agar')


    # Stu 1 - 15 Stationary
    FactoryBot.create(:purchase, consumable: stationary, amount: 10, account: student1)
    FactoryBot.create(:purchase, consumable: stationary, amount: 5,  account: student1)

    # Stu 2 - 9 Stationary, 1 chemical
    FactoryBot.create(:purchase, consumable: stationary, amount: 5 , account: student2)
    FactoryBot.create(:purchase, consumable: stationary, amount: 9, account: student2)
    FactoryBot.create(:purchase, consumable: chemical,   amount: 1,  account: student2)

    # Stu 2 - 4 hardware, 6 wearable, 2 disposable
    FactoryBot.create(:purchase, consumable: hardware,   amount: 4,  account: student3)
    FactoryBot.create(:purchase, consumable: wearable,   amount: 6,  account: student3)
    FactoryBot.create(:purchase, consumable: disposable, amount: 2,  account: student3)
  end

  subject { described_class.new Purchase.all }

  it 'calulates the correct totals for student 1' do
    student1_totals = subject.totals[student1]
    expect(student1_totals['stationary']).to eq 15
  end

  it 'calulates the correct totals for student 2' do
    student2_totals = subject.totals[student2]
    expect(student2_totals['stationary']).to eq 14
    expect(student2_totals['chemical']).to   eq 1
  end

  it 'calulates the correct totals for student 3' do
    student3_totals = subject.totals[student3]
    expect(student3_totals['hardware']).to   eq 4
    expect(student3_totals['wearable']).to   eq 6
    expect(student3_totals['disposable']).to eq 2
  end

end