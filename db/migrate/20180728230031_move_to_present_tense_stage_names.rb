class MoveToPresentTenseStageNames < ActiveRecord::Migration[5.2]
  def change
    OpportunityStage.destroy_all
    
    OpportunityStage.create!([
      {position: 0,  probability: 0.01, togglable: false, name: 'respond to invitation'},

      {position: 1,  probability: 0.05, togglable: false, name: 'research employer'},
      {position: 2,  probability: 0.0,  togglable: false, name: 'connect with employees'},
      {position: 3,  probability: 0.1,  togglable: true,  name: 'customize application materials'},
      {position: 4,  probability: 0.15, togglable: true,  name: 'submit application'},
      {position: 5,  probability: 0.2,  togglable: true,  name: 'follow up after application'},

      {position: 6,  probability: 0.25, togglable: true,  name: 'schedule interview'},
      {position: 7,  probability: 0.3,  togglable: true,  name: 'research interview process'},
      {position: 8,  probability: 0.35, togglable: true,  name: 'practice for interview'},
      {position: 9,  probability: 0.4,  togglable: true,  name: 'attend interview'},
      {position: 10, probability: 0.45, togglable: true,  name: 'follow up after interview'},
  
      {position: 11, probability: 0.5,  togglable: true,  name: 'receive offer'},
      {position: 12, probability: 0.6,  togglable: true,  name: 'submit counter-offer'},
      {position: 13, probability: 0.9,  togglable: true,  name: 'accept offer'},

      {position: 14, probability: 0.95, togglable: true,  name: 'fellow accepted'},
      {position: 15, probability: 1.0,  togglable: true,  name: 'fellow declined'},
      {position: 16, probability: 0.0,  togglable: false, name: 'employer declined'}
    ])
    
    initial_stage = OpportunityStage.find_by(position: 0)
    FellowOpportunity.update_all(opportunity_stage_id: initial_stage.id)
  end
end
